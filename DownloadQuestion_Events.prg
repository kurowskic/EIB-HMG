*-----------------------------------------------------------------------------*
PROCEDURE win_DDownloadQuestion_btn_YES()
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
PROCEDURE win_DDownloadQuestion_btn_NOT()
*-----------------------------------------------------------------------------*

  ViewData( nPage )

  aFrm := CTK_Release( aFrm )

  ThisWindow.Release

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_DDownloadQuestion_OnGotFocus()
*-----------------------------------------------------------------------------*


#IFDEF _HMG_3_

  DO_Events()


  IF  .NOT. EMPTY ( aFrm[ 1 , 2 ] )
  
    win_DownloadQuestion.Row := (  APP_ROW + ( APP_HEIGHT - win_DownloadQuestion.Height ) / 2 )
	
  ELSE
  
      win_DownloadQuestion.Row := ( ( APP_HEIGHT - win_DownloadQuestion.Height ) / 2 )
  ENDIF


  IF  .NOT. EMPTY( aFrm[ 1 , 3 ] )
 
    win_DownloadQuestion.Col := ( APP_COL + ( APP_WIDTH - win_DownloadQuestion.Width ) / 2 ) 
	
  ELSE
  
    win_DownloadQuestion.Col := ( ( APP_WIDTH - win_DownloadQuestion.Width ) / 2 )

  ENDIF

  DO_Events()
	
#ENDIF

 
RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
