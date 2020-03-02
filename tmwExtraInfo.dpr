program tmwExtraInfo;

uses
  Vcl.Forms,
  windows,
  sysutils,
  main in 'main.pas' {frmMain},
  data in 'data.pas' {dm: TDataModule},
  orderinfo in 'orderinfo.pas' {frmOrderInfo},
  unproductive in 'unproductive.pas' {frmUnproductive},
  generatedby in 'generatedby.pas' {frmGeneratedBy},
  gengrid in 'gengrid.pas' {frmGenGrid},
  unprogrid in 'unprogrid.pas' {frmUnproGrid},
  ordgrid in 'ordgrid.pas' {frmordgrid};

{$R *.res}

var
  h,id : integer;

begin

  h := FindWindow(nil,'Extra Info');
  if h>0 then begin
    try
      id := strtoint(paramstr(1));
      postmessage(h,WM_TRACE,id,id);
    except
    end;
    Halt(0);
  end;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmOrderInfo, frmOrderInfo);
  Application.CreateForm(TfrmUnproductive, frmUnproductive);
  Application.CreateForm(TfrmGeneratedBy, frmGeneratedBy);
  Application.CreateForm(TfrmGenGrid, frmGenGrid);
  Application.CreateForm(TfrmUnproGrid, frmUnproGrid);
  Application.CreateForm(Tfrmordgrid, frmordgrid);
  Application.Run;
end.
