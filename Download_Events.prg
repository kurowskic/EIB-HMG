*-----------------------------------------------------------------------------*
PROCEDURE win_Download_OnInit()
*-----------------------------------------------------------------------------*

  CTK_DrawBorder( "win_Download" )

  DO_Events()

  download_csv()
  
  DO_Events()

  aFrm := CTK_Release( aFrm )

  win_Download.Release

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*