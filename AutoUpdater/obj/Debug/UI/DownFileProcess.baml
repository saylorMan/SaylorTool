   M S B A M L   `   `   `  ����F  BAutoUpdater, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:AutoUpdaterAutoUpdater  5      $    AutoUpdater.UI.DownFileProcess    myclr-namespace:AutoUpdater  \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   -   5           AutoUpdater.WindowBase   Name$  w��5   1    � Title$ 软件更新提醒��6	   $	��300��6   $	��450��6%   .��5      � ���#f0f0f0.+�5   
   �  � RowDefinitions 5      �� 5      $��50 �6    6.   �� 5	      $��* �6!   6.   .+�5      �� -   5         ��Name$ versionLabel��5      
���   � �� TextAlignment$ Center=�6A   $��Center=�6X   6u   �� 5      $	��430��6   $��1��6'   $
��Auto=�64   $��Disabled=�6d   .��5      �� -   5        $ txtDes��5      $
��Wrap=�6,   
���   �$	��400��6S   6a   5      5      � 5   
   -   5         �Name$ processGrid��5      ���#f0f0f0.+�5      �� -   5         ��Name$ rectProcess��5      ���#6ed1df$��0��6<   $
��Left=�6F   6d   �� 5      -   5        $ 
txtProcess��5      
���   �$ Center=�6?   $��Center=�6V   6s   5      5      5      