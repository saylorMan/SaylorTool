   M S B A M L   `   `   `  ����   AutoUpdater!    AutoUpdater.UI.UpdateWindow   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     -     � Title$  UpdateWindow��$	��400��$	��500�� � WindowStartupLocation$ CenterScreen=� � WindowStyle$
 None=� � WindowState$ Normal=� � AllowsTransparency .    BaseWindowTemplate2#���   .��� 
������  � 	Resources   btnStyle �� 
TargetType �� Property �� Value	 �� 
TargetType
 �� CornerRadius �� Triggers P� Property P� Value��%i  &	       �� " ��.���  � ��$ 25����  � ��$	 100����  �@�Cursor$
 Hand����  �@J�Opacity$	 .75Q���  � �� �� "	 ��.R�� .+��� #��z��$��1q�$��Center=�#��z��#��z��$
 5��._��� $��1��#��z��$��Center=�$��Center=�$��3 0 3 0q�#��z�� P�  �@J�IsMouseOver . . ���  �@J�Opacity$ 1Q� � RowDefinitions �� $��30 ��� $��* ��� $��1 ��� $��50 �.+��� $
 5,5,0,0�����#32beb3._��� -    ��Name$ 
windowTile��$��更新提醒��$��Center=�$
��Left=�$
��20,0q�
�������$��14(�� ���#f0f0f0$��1��.+�� -    �Name$ 	grid_desc�� �� $��50 ��� $��* �.+��� -   $ versionLabel��$��当前版本��
���   � �� TextAlignment$ Center=�$��Center=��� $��1��$
��Auto=�$��Disabled=�.���� -   $ txtDes��$
��Wrap=�
���   �$	��450��$��14(�� -   $ grid_process��$y�	Collapsed=�.+��� -    ��Name$ rectProcess�����#6ed1df$��0��$
��Left=��� -   $ 
txtProcess��
���   �$ Center=�$��Center=�$��14(��� $��2��
�������� $��3�����#f0f0f0.+���  �� Orientation$ 
Horizontal=�$��Center=�$��Center=�.+��� -	    ��Name$ 	button_No��#��[ 
���   �
���   �
������ �� $��50���� -
   $ 
button_Yes��#��[ 
����������#32beb3