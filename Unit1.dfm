object MainForm: TMainForm
  Left = 192
  Top = 125
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'AOB Changer'
  ClientHeight = 265
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 8
    Width = 67
    Height = 13
    Caption = 'Curent Bytes:'
  end
  object lbl2: TLabel
    Left = 8
    Top = 48
    Width = 66
    Height = 13
    Caption = 'Modify Bytes:'
  end
  object edtAOBCurent: TEdit
    Left = 8
    Top = 24
    Width = 321
    Height = 21
    Enabled = False
    TabOrder = 0
  end
  object edtAOBModify: TEdit
    Left = 8
    Top = 64
    Width = 321
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object ButtonReplace: TButton
    Left = 8
    Top = 88
    Width = 321
    Height = 25
    Caption = 'Replace'
    Enabled = False
    TabOrder = 2
    OnClick = ButtonReplaceClick
  end
  object pnl1: TPanel
    Left = 8
    Top = 120
    Width = 321
    Height = 2
    TabOrder = 3
  end
  object pnl2: TPanel
    Left = 8
    Top = 224
    Width = 321
    Height = 2
    TabOrder = 5
  end
  object ButtonAbout: TButton
    Left = 8
    Top = 232
    Width = 321
    Height = 25
    Caption = 'About'
    TabOrder = 6
  end
  object GroupProcessAttach: TGroupBox
    Left = 8
    Top = 128
    Width = 321
    Height = 89
    Caption = 'Open Process/Attempt Attach'
    TabOrder = 4
    object RadioWindowName: TRadioButton
      Left = 8
      Top = 16
      Width = 89
      Height = 17
      Caption = 'Window Name'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RadioPID: TRadioButton
      Left = 104
      Top = 16
      Width = 41
      Height = 17
      Caption = 'PID'
      TabOrder = 1
    end
    object EditProcessAttach: TEdit
      Left = 8
      Top = 32
      Width = 305
      Height = 21
      TabOrder = 2
    end
    object ButtonConnect: TButton
      Left = 8
      Top = 56
      Width = 305
      Height = 25
      Caption = 'Connect'
      TabOrder = 3
      OnClick = ButtonConnectClick
    end
  end
end
