*-----------------------------------------------------------------------------*
PROCEDURE About_btn_OK()
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
PROCEDURE About_OnInit()
*-----------------------------------------------------------------------------*


  DoMethod("win_About" , "Hide" )

  SetCenterModalWindow( aFormProperty )

  SetAdjustControls( aFrmControls )

   CTK_DrawBorder( "win_About" )
  DoMethod("win_About" , "Show" )

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE About_OnGotFocus()
*-----------------------------------------------------------------------------*

  SetCenterModalWindow( aFormProperty )

  SetAdjustControls( aFrmControls )

  CTK_DrawBorder( "win_About" )

RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
