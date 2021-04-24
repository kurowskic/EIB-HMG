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
PROCEDURE win_Download_OnGotFocus()
*-----------------------------------------------------------------------------*


#IFDEF _HMG_3_

  do_events()


  IF  .NOT. EMPTY ( aFrm[ 1 , 2 ] )
  
    win_Download.Row := (  APP_ROW + ( APP_HEIGHT - win_Download.Height ) / 2 )
	
  ELSE
  
      win_Download.Row := ( ( APP_HEIGHT - win_Download.Height ) / 2 )
  ENDIF


  IF  .NOT. EMPTY( aFrm[ 1 , 3 ] )
 
    win_Download.Col := ( APP_COL + ( APP_WIDTH - win_Download.Width ) / 2 ) 
	
  ELSE
  
    win_Download.Col := ( ( APP_WIDTH - win_Download.Width ) / 2 )

  ENDIF

  do_events()
	
#ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
