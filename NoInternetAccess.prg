*-----------------------------------------------------------------------------*
#include "eib_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE NoInternetAccess()
*-----------------------------------------------------------------------------*

  DECLARE WINDOW win_Main
  DECLARE WINDOW win_NoInternetAccess


  IF !IsWIndowDefined( win_NoInternetAccess )


#IFDEF _HMG_2_

    LOAD WINDOW NoInternetAccess2 AS win_NoInternetAccess

    win_NoInternetAccess.TitleBar := .F.
    win_NoInternetAccess.SysMenu  := .T.
    win_NoInternetAccess.Sizable  := .F.

#ENDIF


#IFDEF _HMG_3_

    LOAD WINDOW NoInternetAccess3 AS win_NoInternetAccess

#ENDIF


    SetProperty( "win_NoInternetAccess" , "btn_YES" , "Action" , { || win_NoInternetAccess_btn_YES() } )
    SetProperty( "win_NoInternetAccess" , "btn_NOT" , "Action" , { || win_NoInternetAccess_btn_NOT() } )


    ON KEY ALT+F4 OF win_NoInternetAccess ACTION { || NIL }


    AADD( aFrm , { "win_NoInternetAccess"    , ;
                 win_NoInternetAccess.Row  , ;
                 win_NoInternetAccess.Col  , ;
               } )


    win_NoInternetAccess.img_APPTitle.Picture  := "APP_MAIN"

    win_NoInternetAccess.Activate

  ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
#include "NoInternetAccess_Events.prg"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
