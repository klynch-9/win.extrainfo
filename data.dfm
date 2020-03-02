object dm: Tdm
  OldCreateOrder = False
  Height = 165
  Width = 331
  object psbison: TADOConnectionPSBISON
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=psbison;Data Source=sqlserver'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 32
    Top = 8
  end
  object qryMain: TADOQuery
    Connection = psbison
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ord'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      ''
      'select col_row'
      '  ,temp1=max(case when ed.col_id=7 then col_data else '#39#39' end)'
      '  ,temp2=max(case when ed.col_id=8 then col_data else '#39#39' end)'
      '  ,temp3=max(case when ed.col_id=9 then col_data else '#39#39' end)'
      '  ,Extra1 =max(case when ed.col_id=12 then col_data else '#39#39' end)'
      '  ,Extra2=max(case when ed.col_id=13 then col_data else '#39#39' end)'
      '  ,Erap=max(case when ed.col_id=14 then col_data else '#39#39' end)'
      '  ,Steers=max(case when ed.col_id=15 then col_data else '#39#39' end)'
      '  ,Drives=max(case when ed.col_id=16 then col_data else '#39#39' end)'
      '  ,Trailer=max(case when ed.col_id=17 then col_data else '#39#39' end)'
      '  ,HazName=max(case when ed.col_id=18 then col_data else '#39#39' end)'
      '  ,UN=max(case when ed.col_id=19 then col_data else '#39#39' end)'
      
        '  ,PkgGroup=max(case when ed.col_id=20 then col_data else '#39#39' end' +
        ')'
      '  ,ph24hr=max(case when ed.col_id=21 then col_data else '#39#39' end)'
      'FROM extra_info_data ed(nolock) '
      'join EXTRA_INFO_COLS ec(nolock) on ed.col_id=ec.COL_ID'
      'where table_key=:ord and ec.extra_id = 7 and ec.tab_id =1 '
      'group by col_row')
    Left = 32
    Top = 56
    object qryMaincol_row: TIntegerField
      FieldName = 'col_row'
    end
    object qryMaintemp1: TStringField
      FieldName = 'temp1'
      ReadOnly = True
      Size = 7665
    end
    object qryMaintemp2: TStringField
      FieldName = 'temp2'
      ReadOnly = True
      Size = 7665
    end
    object qryMaintemp3: TStringField
      FieldName = 'temp3'
      ReadOnly = True
      Size = 7665
    end
    object qryMainExtra1: TStringField
      FieldName = 'Extra1'
      ReadOnly = True
      Size = 7665
    end
    object qryMainExtra2: TStringField
      FieldName = 'Extra2'
      ReadOnly = True
      Size = 7665
    end
    object qryMainErap: TStringField
      FieldName = 'Erap'
      ReadOnly = True
      Size = 7665
    end
    object qryMainSteers: TStringField
      FieldName = 'Steers'
      ReadOnly = True
      Size = 7665
    end
    object qryMainDrives: TStringField
      FieldName = 'Drives'
      ReadOnly = True
      Size = 7665
    end
    object qryMainTrailer: TStringField
      FieldName = 'Trailer'
      ReadOnly = True
      Size = 7665
    end
    object qryMainHazName: TStringField
      FieldName = 'HazName'
      ReadOnly = True
      Size = 7665
    end
    object qryMainUN: TStringField
      FieldName = 'UN'
      ReadOnly = True
      Size = 7665
    end
    object qryMainPkgGroup: TStringField
      FieldName = 'PkgGroup'
      ReadOnly = True
      Size = 7665
    end
    object qryMainph24hr: TStringField
      FieldName = 'ph24hr'
      ReadOnly = True
      Size = 7665
    end
  end
  object qry: TADOQuery
    Connection = psbison
    CursorType = ctStatic
    Parameters = <>
    Left = 80
    Top = 56
  end
  object qryUnpro: TADOQuery
    Connection = psbison
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ord'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      'SELECT col_data,ec.col_id,col_name'
      'FROM extra_info_data ed(nolock) '
      'join EXTRA_INFO_COLS ec(nolock) on ed.col_id=ec.COL_ID'
      'WHERE ec.extra_id = 7 and ec.tab_id =2 and'
      'table_key=:ord')
    Left = 120
    Top = 56
    object StringField3: TStringField
      FieldName = 'col_data'
      Size = 7665
    end
    object AutoIncField2: TAutoIncField
      FieldName = 'col_id'
      ReadOnly = True
    end
    object StringField4: TStringField
      FieldName = 'col_name'
      Size = 50
    end
  end
  object qryGen: TADOQuery
    Connection = psbison
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ord'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      'SELECT col_data,ec.col_id,col_name,col_row'
      'FROM extra_info_data ed(nolock) '
      'join EXTRA_INFO_COLS ec(nolock) on ed.col_id=ec.COL_ID'
      'WHERE ec.extra_id = 7 and ec.tab_id =3 and'
      'table_key=:ord')
    Left = 168
    Top = 56
    object StringField5: TStringField
      FieldName = 'col_data'
      Size = 7665
    end
    object AutoIncField3: TAutoIncField
      FieldName = 'col_id'
      ReadOnly = True
    end
    object StringField6: TStringField
      FieldName = 'col_name'
      Size = 50
    end
    object qryGencol_row: TIntegerField
      FieldName = 'col_row'
    end
  end
  object dsGen: TDataSource
    DataSet = qryGen
    Left = 168
    Top = 104
  end
  object qryUP: TADOQuery
    Connection = psbison
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ord'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end>
    SQL.Strings = (
      'SELECT col_data,ec.col_id,col_name,col_row'
      'FROM extra_info_data ed(nolock) '
      'join EXTRA_INFO_COLS ec(nolock) on ed.col_id=ec.COL_ID'
      'WHERE ec.extra_id = 7 and ec.tab_id =2 and'
      'table_key=:ord')
    Left = 216
    Top = 56
    object StringField1: TStringField
      FieldName = 'col_data'
      Size = 7665
    end
    object AutoIncField1: TAutoIncField
      FieldName = 'col_id'
      ReadOnly = True
    end
    object StringField2: TStringField
      FieldName = 'col_name'
      Size = 50
    end
    object qryUPcol_row: TIntegerField
      FieldName = 'col_row'
    end
  end
  object dsUP: TDataSource
    DataSet = qryUP
    Left = 216
    Top = 104
  end
  object dsmain: TDataSource
    DataSet = qryMain
    Left = 32
    Top = 104
  end
end
