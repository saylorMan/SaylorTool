   M S B A M L   `   `   `  ����  AutoUpdater!    AutoUpdater.UI.UpdateWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   -   5          � Title$  UpdateWindow��5   	   $	��400��6   $	��500��6+    � WindowStartupLocation$ CenterScreen=�5   	    � WindowStyle$
 None=�6.    � WindowState$ Normal=�6A    � AllowsTransparency .    BaseWindowTemplate2#���   5   	   .��5      � 
������  � 	Resources 5   
     btnStyle �� 
TargetType �� Property �� Value	 �� 
TargetType
 �� CornerRadius �� Triggers P� Property P� Value��%�  &	       �� 5	      " ��6%   .�5
      ��  � ��$ 25��6+   68   �� 5       � ��$	 100��6*   68   �� 5       �@�Cursor$
 Hand��6+   6:   �� 5       �@J�Opacity$	 .75Q�6,   6:   �� 5       � �� 5      �� 5      "	 ��6*   .R�5      � .+�5   "   �� #��z��6)   $��1q�6U   $��Center=�6i   #��z��6�   #��z��6�   $
 5��6�   ._�5   &   �� $��1��60   #��z��6@   $��Center=�6a   $��Center=�6}   $��3 0 3 0q�6�   #��z��5   1   6]   5   #   5       5      P� 5   "    �@J�IsMouseOver . . �5   &   ��  �@J�Opacity$ 1Q�6@   5   #   5      5      5      5        � RowDefinitions 5!   
   �� 5"      $��30 �6   �� 5#      $��* �6   �� 5$      $��1 �6   �� 5%      $��50 �6   .+�5'   
   �� $
 5,5,0,0��6   ���#32beb3._�5(      �� -   5         ��Name$ 
windowTile��5(      $��更新提醒��6,   $��Center=�68   $
��Left=�6S   $
��20,0q�6n   
�������$��14(�6�   6�   5)      � 5*   
   ���#f0f0f0$��1��6&   .+�5+      � -   5         �Name$ 	grid_desc��5+       5,      �� 5-      $��50 �6$   62   �� 5.      $��* �6%   62   .+�50      �� -   5        $ versionLabel��50      $��当前版本��62   
���   � �� TextAlignment$ Center=�6R   $��Center=�6i   6�   �� 51      $��1��6    $
��Auto=�6-   $��Disabled=�6]   .��52      �� -   5        $ txtDes��52       $
��Wrap=�60   
���   �$	��450��6W   $��14(�6c   6s   53      54      � 56      -   5        $ grid_process��56      $y�	Collapsed=�6)   .+�57      �� -   5         ��Name$ rectProcess��57      ���#6ed1df$��0��6@   $
��Left=�6J   6h   �� 58      -   5        $ 
txtProcess��58      
���   �$ Center=�6C   $��Center=�6Z   $��14(�6u   6�   59      5:      �� 5;   
   $��2��6   
�������6/   � 5<   
   $��3��6   ���#f0f0f0.+�5=      ��  �� Orientation$ 
Horizontal=�6   $��Center=�62   $��Center=�6O   .+�5>      �� -	   5         ��Name$ 	button_No��5>      #��[ 6,   
���   �
���   �
������ 6�   �� 5?      $��50��6   6*   �� 5@      -
   5        $ 
button_Yes��5@      #��[ 6.   
����������#32beb36�   5A      5B      5C      5D      