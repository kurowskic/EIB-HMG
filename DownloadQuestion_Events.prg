*-----------------------------------------------------------------------------*
PROCEDURE win_DownloadQuestion_btn_YES()
*-----------------------------------------------------------------------------*

  CTK_DrawBorder( "win_DownloadQuestion" )

  DO_Events()

  win_DownloadQuestion.Hide

  Download()
  DataBaseInit()


#IFDEF _HMG_3_

  win_Main.Hide
  win_Main.Show

#ENDIF


  aFrm := CTK_Release( aFrm )

  ThisWindow.Release

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_DownloadQuestion_btn_NOT()
*-----------------------------------------------------------------------------*

  ViewData( nPage )

  aFrm := CTK_Release( aFrm )

  ThisWindow.Release

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_DownloadQuestion_OnGotFocus()
*-----------------------------------------------------------------------------*

  CenterModalWindow( "win_DownloadQuestion" )

  AutoAdjustControls( "win_DownloadQuestion" )

  CTK_DrawBorder( "win_DownloadQuestion" )

 
RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
