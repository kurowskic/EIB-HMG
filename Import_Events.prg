*-----------------------------------------------------------------------------*
PROCEDURE win_Import_OnInit()
*-----------------------------------------------------------------------------*

  CTK_DrawBorder( "win_Import" )

  DO_Events()

  win_Main.txb_Name.Value    := ""
  win_Main.txb_Address.Value := ""
  win_Main.txb_Place.Value   := ""

  DO_Events()

  ClearRecords()

  DO_Events()

//  download_csv()
DataBaseSqliteImportDataBase()

  DO_Events()

  aFrm := CTK_Release( aFrm )

  win_Import.Release

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Import_OnGotFocus()
*-----------------------------------------------------------------------------*

  CenterModalWindow( "win_Import" )

  AutoAdjustControls( "win_Import" )

  CTK_DrawBorder( "win_Import" )

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
