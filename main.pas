unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxDateRanges, Data.DB,   Vcl.ExtCtrls, Vcl.Menus,  Vcl.StdCtrls, cxButtons,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxControls, cxContainer,
  cxEdit, cxLabel, dxBarBuiltInMenu, cxPC;

const
  WM_TRACE = WM_USER + 30;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    pages: TcxPageControl;
    tabOrd: TcxTabSheet;
    tabUnproductive: TcxTabSheet;
    tabGenerated: TcxTabSheet;
    procedure FormShow(Sender: TObject);
    procedure pagesChange(Sender: TObject);
  private
    procedure WMTrace(var Message: TMessage);
    { Private declarations }
  public
    { Public declarations }
    id:integer;
    procedure loadOrderInfo(id:integer);
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses data,pfunc,inthelper,datetimehelper,ordgrid,unprogrid,gengrid;


procedure TfrmMain.FormShow(Sender: TObject);
begin
  caption := 'Extra Info';
  try
    //id:=3937204;
    id := strtointdef(paramstr(1),-1);
    if id>0 then begin
      loadorderinfo(id);
    end;
  except
  end;
end;

procedure TfrmMain.loadOrderInfo(id:integer);
var col:integer;
    data:string;
begin
  with dm.qryMain do begin
    close;
    parameters[0].Value:=id;
    open;
    {while not eof do  begin
      col:=fieldbyname('col_id').AsInteger;
      data:=fieldbyname('col_data').asstring;
      if col=7 then  frmorderinfo.etemp1.text:=data
      else if col=8 then frmorderinfo.etemp2.text:=data
      else if col=9 then frmorderinfo.etemp3.text:=data
      else if col=12 then frmorderinfo.eExtra1.text:=data
      else if col=13 then frmorderinfo.eExtra2.text:=data
      else if col=14 then frmorderinfo.cbERAP.text:=data
      else if col=15 then frmorderinfo.eSteers.text:=data
      else if col=16 then frmorderinfo.eDrives.text:=data
      else if col=17 then frmorderinfo.eTrailer.text:=data
      else if col=18 then frmorderinfo.eHazName.text:=data
      else if col=19 then frmorderinfo.eUN.text:=data
      else if col=20 then frmorderinfo.ePkgGroup.text:=data
      else if col=21 then frmorderinfo.e24hr.text:=data;
      next;
    end;
  }
  end;
  with frmordgrid do begin
    parent := tabOrd;
    align := alClient;
    borderstyle := bsNone;
    show;
  end;
  frmMain.Caption:= caption+' Order: '+id.ToString();
end;

procedure TfrmMain.pagesChange(Sender: TObject);
begin
  if (pages.ActivePageIndex=0) and (not frmOrdgrid.visible) then
    with frmOrdgrid do begin
      parent := tabOrd;
      align := alClient;
      borderstyle := bsNone;
      show;
    end;
  if (pages.ActivePageIndex=2) and (not frmGenGrid.visible) then
    with frmGengrid do begin
      parent := tabGenerated;
      align := alClient;
      borderstyle := bsNone;
      show;
    end;
  if (pages.ActivePageIndex=1) and (not frmUnproGrid.visible) then
    with frmUnproGrid do begin
      parent := tabunproductive;
      align := alClient;
      borderstyle := bsNone;
      show;
    end;
end;

procedure TfrmMain.WMTrace(var Message: TMessage);
var
  id : integer;
begin
  try
    id := message.WParam;
    if id>0 then begin
      loadOrderInfo(id);
    end;
  except
  end;
end;



end.
