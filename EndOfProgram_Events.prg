*-----------------------------------------------------------------------------*
PROCEDURE win_EndOfProgram_btn_YES()
*-----------------------------------------------------------------------------*

  RELEASE WINDOW ALL

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_EndOfProgram_btn_NOT()
*-----------------------------------------------------------------------------*

  ViewData( nPage )

  aFrm := CTK_Release( aFrm )

  ThisWindow.Release

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE win_EndOfProgram_OnGotFocus()
*-----------------------------------------------------------------------------*

 
#IFDEF _HMG_3_

  do_events()


  IF  .NOT. EMPTY ( aFrm[ 1 , 2 ] )
  
    win_EndOfProgram.Row := (  APP_ROW + ( APP_HEIGHT - win_EndOfProgram.Height ) / 2 )
	
  ELSE
  
      win_EndOfProgram.Row := ( ( APP_HEIGHT - win_EndOfProgram.Height ) / 2 )
  ENDIF


  IF  .NOT. EMPTY( aFrm[ 1 , 3 ] )
 
    win_EndOfProgram.Col := ( APP_COL + ( APP_WIDTH - win_EndOfProgram.Width ) / 2 ) 
	
  ELSE
  
    win_EndOfProgram.Col := ( ( APP_WIDTH - win_EndOfProgram.Width ) / 2 )

  ENDIF


  do_events()
	
#ENDIF 


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
