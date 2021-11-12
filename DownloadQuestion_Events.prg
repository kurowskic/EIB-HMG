*-----------------------------------------------------------------------------*
PROCEDURE win_DownloadQuestion_btn_YES()
*-----------------------------------------------------------------------------*

  CTK_DrawBorder( "win_DownloadQuestion" )

  DO_Events()

  win_Main_buttons_Disable()
  DO_Events()

  win_DownloadQuestion.Hide

  Download()


#IFDEF __SQLITE__

  DataBaseSqliteCreate()
//  DataBaseInit()
DataBaseImport()
  
#ELSE

//  DataBaseInit()
DataBaseImport()

#ENDIF


#IFDEF _HMG_3_

  win_Main.Hide
  win_Main.Show

#ENDIF

  win_Main_buttons_Enable()
  DO_Events()

  aFrm := CTK_Release( aFrm )

  ThisWindow.Release

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_DownloadQuestion_btn_NOT()
*-----------------------------------------------------------------------------*

#IFDEF __SQLITE__

  DataBaseSqliteViewData( nPage )

#ELSE

  ViewData( nPage )

#ENDIF


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
