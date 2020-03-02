unit data;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, ADOConnectionSQL;

type
  Tdm = class(TDataModule)
    psbison: TADOConnectionPSBISON;
    qryMain: TADOQuery;
    qry: TADOQuery;
    qryUnpro: TADOQuery;
    StringField3: TStringField;
    AutoIncField2: TAutoIncField;
    StringField4: TStringField;
    qryGen: TADOQuery;
    StringField5: TStringField;
    AutoIncField3: TAutoIncField;
    StringField6: TStringField;
    dsGen: TDataSource;
    qryUP: TADOQuery;
    StringField1: TStringField;
    AutoIncField1: TAutoIncField;
    StringField2: TStringField;
    dsUP: TDataSource;
    dsmain: TDataSource;
    qryMaincol_row: TIntegerField;
    qryMaintemp1: TStringField;
    qryMaintemp2: TStringField;
    qryMaintemp3: TStringField;
    qryMainExtra1: TStringField;
    qryMainExtra2: TStringField;
    qryMainErap: TStringField;
    qryMainSteers: TStringField;
    qryMainDrives: TStringField;
    qryMainTrailer: TStringField;
    qryMainHazName: TStringField;
    qryMainUN: TStringField;
    qryMainPkgGroup: TStringField;
    qryMainph24hr: TStringField;
    qryUPcol_row: TIntegerField;
    qryGencol_row: TIntegerField;

  private

    { Private declarations }
  public
    { Public declarations }
    procedure InsertExtraInfo(tab, col, row: integer; data: string);
    procedure updateExtraInfo(data: string; id,row: integer);
    procedure deleteExtraInfo(tab, row: integer);
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses main;

procedure Tdm.deleteExtraInfo(tab,row:integer);
begin
  with qry do begin
    close;
    sql.text:='delete from extra_info_data where extra_id=7 and tab_id=:tab and col_row=:row and table_key=:key';
    parameters[0].Value:=tab;
    parameters[1].Value:=row;
    parameters[2].Value:=FrmMain.id;
    execsql;
  end;
end;


procedure Tdm.updateExtraInfo(data:string;id,row:integer);
begin
  with qry do begin
    close;
    sql.text:='update extra_info_data set col_data = :data where col_id=:id and table_key=:key and col_row=:row';
    parameters[0].Value:=data;
    parameters[1].Value:=id;
    parameters[2].Value:=FrmMain.id;
    parameters[3].Value:=row;
    execsql;
  end;
end;

procedure Tdm.InsertExtraInfo(tab,col,row:integer;data:string);
begin
  with dm.qry do begin
    close;
    sql.text:='insert into extra_info_data (EXTRA_ID,TAB_ID,COL_ID,COL_DATA,TABLE_KEY,col_row)';
    sql.Add('values(7,:tab,:col,:data,:key,:row)') ;
    parameters[0].Value:=tab;
    parameters[1].Value:=col;
    parameters[2].Value:=data;
    parameters[3].Value:=frmMain.id;
    parameters[4].Value:=row;
    execsql;
  end;
end;

end.
