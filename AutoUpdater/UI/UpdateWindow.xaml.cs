﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace AutoUpdater.UI
{
    /// <summary>
    /// UpdateWindow.xaml 的交互逻辑
    /// </summary>
    public partial class UpdateWindow : Window
    {

        #region property

        private string updateFileDir;//更新文件存放的文件夹
        private string callExeName;
        private string appDir;
        private string appName;
        private string appVersion;
        private string desc;

        #endregion

        #region method

        public UpdateWindow(string callExeName, string updateFileDir, string appDir, string appName, string appVersion, string desc)
        {
            InitializeComponent();
            
            this.callExeName = System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(callExeName));
            this.updateFileDir = System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(updateFileDir));
            this.appDir = System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(appDir));
            this.appName = System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(appName));
            this.appVersion = System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(appVersion));

            string sDesc = System.Text.Encoding.UTF8.GetString(Convert.FromBase64String(desc));
            if (sDesc.ToLower().Equals("null"))
            {
                this.desc = "";
            }
            else
            {
                this.desc = "更新内容如下:\r\n" + sDesc;
            }
        }


        private void UpdateNow()
        {
            //关闭主应用

            AutoUpdater.Lib.ProcessHelper.KillProcess(this.callExeName);
            Thread.Sleep(3000);
            grid_desc.Visibility = System.Windows.Visibility.Collapsed;
            grid_process.Visibility = System.Windows.Visibility.Visible;
            DownloadUpdateFile();
        }
        private void UpdateLater()
        {
            this.Close();
        }

        private void StartNow()
        {
            WhetherStartApp(true);
            this.Close();
        }

        private void StartLater()
        {
            this.Close();
        }


        /// <summary>
        /// 开始下载更新的zip
        /// </summary>
        private void DownloadUpdateFile()
        {
            try
            {
                string url = Constants.RemoteUrl_zip;
                var client = new System.Net.WebClient();
                client.DownloadProgressChanged += (sender, e) =>
                {
                    UpdateProcess(e.BytesReceived, e.TotalBytesToReceive);
                };
                client.DownloadDataCompleted += client_DownloadDataCompleted_File;
                client.DownloadDataAsync(new Uri(url));
                SetButtonState();
            }
            catch (Exception ex)
            {
                WriteLogHelper.WriteLog_client("DownloadUpdateFile error", ex);
                MessageBox.Show(ex.Message);
            }
        }
        void client_DownloadDataCompleted_File(object sender, System.Net.DownloadDataCompletedEventArgs e)
        {
            UpdateLocalFile(sender, e);
            this.txtProcess.Text = "更新完成，是否现在启动程序？";
            SetButtonState();
            button_Yes.Content = "现在启动";
            button_No.Content = "稍后启动";
        }

        private void WhetherStartApp(bool whether)
        {
            if (whether)
            {
                try
                {
                    Action f = () =>
                    {
                        string exePath = System.IO.Path.Combine(appDir, callExeName + ".exe");
                        var info = new System.Diagnostics.ProcessStartInfo(exePath);
                        info.UseShellExecute = true;
                        info.WorkingDirectory = appDir;// exePath.Substring(0, exePath.LastIndexOf(System.IO.Path.DirectorySeparatorChar));
                        System.Diagnostics.Process.Start(info);
                    };
                    this.Dispatcher.Invoke(f);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        /// <summary>
        /// 下载完成之后更新本地文件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void UpdateLocalFile(object sender, System.Net.DownloadDataCompletedEventArgs e)
        {
            try
            {
                string zipFilePath = System.IO.Path.Combine(updateFileDir, Constants.ZipFileName);
                byte[] data = e.Result;
                BinaryWriter writer = new BinaryWriter(new FileStream(zipFilePath, FileMode.OpenOrCreate));
                writer.Write(data);
                writer.Flush();
                writer.Close();
                System.Threading.ThreadPool.QueueUserWorkItem((s) =>
                {
                    string tempDir = System.IO.Path.Combine(updateFileDir, "temp");
                    if (!Directory.Exists(tempDir))
                    {
                        Directory.CreateDirectory(tempDir);
                    }
                    UnZipFile(zipFilePath, tempDir);

                    //移动文件
                    if (Directory.Exists(System.IO.Path.Combine(tempDir, Constants.UnzipFoldName)))
                    {
                        CopyDirectory(System.IO.Path.Combine(tempDir, Constants.UnzipFoldName), appDir);
                    }
                });
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
           
        }

        private void UnZipFile(string zipFilePath, string targetDir)
        {
            try
            {
                ICCEmbedded.SharpZipLib.Zip.FastZipEvents evt = new ICCEmbedded.SharpZipLib.Zip.FastZipEvents();
                ICCEmbedded.SharpZipLib.Zip.FastZip fz = new ICCEmbedded.SharpZipLib.Zip.FastZip(evt);
                fz.ExtractZip(zipFilePath, targetDir, "");
            }
            catch (Exception ex)
            {
                WriteLogHelper.WriteLog_client("UnZipFile error", ex);
                MessageBox.Show(ex.Message);
            }
        }

        private void CopyDirectory(string sourceDirName, string destDirName)
        {
            try
            {
                if (!Directory.Exists(destDirName))
                {
                    Directory.CreateDirectory(destDirName);
                    File.SetAttributes(destDirName, File.GetAttributes(sourceDirName));
                }
                if (destDirName[destDirName.Length - 1] != Path.DirectorySeparatorChar)
                    destDirName = destDirName + Path.DirectorySeparatorChar;
                string[] files = Directory.GetFiles(sourceDirName);
                foreach (string file in files)
                {
                    File.Copy(file, destDirName + Path.GetFileName(file), true);
                    File.SetAttributes(destDirName + Path.GetFileName(file), FileAttributes.Normal);
                }
                string[] dirs = Directory.GetDirectories(sourceDirName);
                foreach (string dir in dirs)
                {
                    CopyDirectory(dir, destDirName + Path.GetFileName(dir));
                }
            }
            catch (Exception ex)
            {
                WriteLogHelper.WriteLog_client("CopyDirectory error", ex);
                MessageBox.Show(ex.Message);

                throw;
            }
        }

        private void UpdateProcess(long current, long total)
        {
            string status = (int)((float)current * 100 / (float)total) + "%";
            this.txtProcess.Text = status;
            rectProcess.Width = ((float)current / (float)total) * this.ActualWidth;
        }


        void SetButtonState()
        {
            button_No.IsEnabled = !button_No.IsEnabled;
            button_Yes.IsEnabled = !button_Yes.IsEnabled;
            
        }
        #endregion

        #region event

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            versionLabel.Text = this.appName + "发现新的版本(" + this.appVersion + ")";
            button_Yes.Content = "现在更新";
            button_No.Content = "暂不更新";
            txtDes.Text = this.desc;

        }
        private void button_Click(object sender, RoutedEventArgs e)
        {
            Button btn = sender as Button;
            if (btn != null && btn.Content != null)
            {
                switch (btn.Content.ToString())
                {
                    case "现在更新":
                        UpdateNow();
                        break;
                    case "暂不更新":
                        UpdateLater();
                        break;
                    case "现在启动":
                        StartNow();
                        break;
                    case "稍后启动":
                        StartLater();
                        break;
                    default:
                        break;
                }
            }
        }


        #endregion







    }
}
