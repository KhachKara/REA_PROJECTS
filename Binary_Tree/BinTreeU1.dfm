object Form1: TForm1
  Left = 195
  Top = 198
  BorderStyle = bsSingle
  Caption = #1041#1080#1085#1072#1088#1085#1086#1077' '#1076#1077#1088#1077#1074#1086' '#1087#1086#1080#1089#1082#1072
  ClientHeight = 476
  ClientWidth = 459
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 175
    Height = 13
    Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1101#1083#1077#1084#1077#1085#1090#1086#1074' '#1080#1079' '#1089#1087#1080#1089#1082#1072
  end
  object Label2: TLabel
    Left = 16
    Top = 24
    Width = 129
    Height = 13
    Caption = #1060#1086#1088#1084#1072#1090': '#1082#1083#1102#1095'->'#1079#1085#1072#1095#1077#1085#1080#1077
  end
  object Memo1: TMemo
    Left = 24
    Top = 48
    Width = 425
    Height = 329
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button1: TButton
    Left = 336
    Top = 8
    Width = 113
    Height = 17
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
    TabOrder = 1
    OnClick = Button1Click
  end
  object SaveMemo: TMemo
    Left = 24
    Top = 248
    Width = 185
    Height = 89
    Lines.Strings = (
      'SaveMemo')
    TabOrder = 2
    Visible = False
  end
  object Button2: TButton
    Left = 336
    Top = 24
    Width = 113
    Height = 17
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 200
    Top = 8
    Width = 113
    Height = 17
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1079' '#1089#1087#1080#1089#1082#1072
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 304
    Top = 384
    Width = 137
    Height = 17
    Caption = #1057#1080#1084#1084#1077#1090#1088#1080#1095#1085#1099#1081' '#1087#1088#1086#1093#1086#1076
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 160
    Top = 384
    Width = 137
    Height = 17
    Caption = #1055#1088#1086#1093#1086#1076' '#1089#1085#1080#1079#1091' '#1074#1074#1077#1088#1093
    TabOrder = 6
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 16
    Top = 384
    Width = 137
    Height = 17
    Caption = #1055#1088#1086#1093#1086#1076' '#1089#1074#1077#1088#1093#1091' '#1074#1085#1080#1079
    TabOrder = 7
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 312
    Top = 448
    Width = 137
    Height = 17
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1077#1088#1077#1074#1086
    TabOrder = 8
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 168
    Top = 448
    Width = 137
    Height = 17
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1091#1079#1077#1083
    TabOrder = 9
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 200
    Top = 24
    Width = 113
    Height = 17
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1101#1083#1077#1084#1077#1085#1090
    TabOrder = 10
    OnClick = Button9Click
  end
  object Button10: TButton
    Left = 16
    Top = 416
    Width = 129
    Height = 17
    Caption = #1051#1080#1089#1090#1100#1103' '#1087#1086' '#1091#1088#1086#1074#1085#1103#1084
    TabOrder = 11
    OnClick = Button10Click
  end
  object Button11: TButton
    Left = 152
    Top = 416
    Width = 145
    Height = 17
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1083#1080#1089#1090#1100#1103' '#1085#1072' '#1091#1088#1086#1074#1085#1077
    TabOrder = 12
    OnClick = Button11Click
  end
  object Button12: TButton
    Left = 304
    Top = 416
    Width = 145
    Height = 17
    Caption = #1042#1089#1077' '#1091#1079#1083#1099' '#1085#1072' '#1091#1088#1086#1074#1085#1077' '#1089'...'
    TabOrder = 13
    OnClick = Button12Click
  end
  object OpenDialog1: TOpenDialog
    Left = 80
    Top = 168
  end
  object SaveDialog1: TSaveDialog
    Left = 120
    Top = 152
  end
  object MainMenu1: TMainMenu
    Left = 56
    Top = 72
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N5: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
        OnClick = N5Click
      end
      object N6: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' '#1092#1072#1081#1083
        OnClick = N6Click
      end
    end
    object N2: TMenuItem
      Caption = #1052#1086#1076#1080#1092#1080#1082#1072#1094#1080#1080
      object N7: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1079' '#1089#1087#1080#1089#1082#1072
        OnClick = N7Click
      end
      object N8: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1101#1083#1077#1084#1077#1085#1090
        OnClick = N8Click
      end
      object N9: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1091#1079#1077#1083
        OnClick = N9Click
      end
      object N10: TMenuItem
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1077#1088#1077#1074#1086
        OnClick = N10Click
      end
    end
    object N3: TMenuItem
      Caption = #1055#1088#1086#1093#1086#1076#1099
      object N11: TMenuItem
        Caption = #1055#1088#1086#1093#1086#1076' '#1089#1074#1077#1088#1093#1091' '#1074#1085#1080#1079
        OnClick = N11Click
      end
      object N12: TMenuItem
        Caption = #1055#1088#1086#1093#1086#1076' '#1089#1085#1080#1079#1091' '#1074#1074#1077#1088#1093
        OnClick = N12Click
      end
      object N13: TMenuItem
        Caption = #1057#1080#1084#1084#1077#1090#1088#1080#1095#1085#1099#1081' '#1087#1088#1086#1093#1086#1076
        OnClick = N13Click
      end
    end
    object N4: TMenuItem
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
      object N14: TMenuItem
        Caption = #1057#1087#1080#1089#1086#1082' '#1083#1080#1089#1090#1100#1077#1074' '#1087#1086' '#1091#1088#1086#1074#1085#1103#1084
        OnClick = N14Click
      end
      object N15: TMenuItem
        Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1083#1080#1089#1090#1100#1077#1074' '#1085#1072' '#1091#1088#1086#1074#1085#1077
        OnClick = N15Click
      end
      object N16: TMenuItem
        Caption = #1055#1086#1076#1089#1095#1077#1090' '#1091#1079#1083#1086#1074' '#1085#1072' '#1091#1088#1086#1074#1085#1077' '#1089' '#1079#1072#1076#1072#1085#1085#1099#1084
        OnClick = N16Click
      end
    end
  end
end
