*-----------------------------------------------------------------------------*
PROCEDURE win_Download_OnInit()
*-----------------------------------------------------------------------------*

  CTK_DrawBorder( "win_Download" )

  DO_Events()

  win_Main.txb_Name.Value    := ""
  win_Main.txb_Address.Value := ""
  win_Main.txb_Place.Value   := ""

  DO_Events()

  ClearRecords()

  DO_Events()

  download_csv()
  
  DO_Events()

  aFrm := CTK_Release( aFrm )

  win_Download.Release

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_Download_OnGotFocus()
*-----------------------------------------------------------------------------*

  CenterModalWindow( "win_Download" )

  AutoAdjustControls( "win_Download" )

  CTK_DrawBorder( "win_Download" )

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
