*-----------------------------------------------------------------------------*
#include "eib_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE DownloadQuestion( xlbl_0 )
*-----------------------------------------------------------------------------*

  DECLARE WINDOW win_Main
  DECLARE WINDOW win_DownloadQuestion


  IF !IsWIndowDefined( win_DownloadQuestion )


#IFDEF _HMG_2_

    LOAD WINDOW DownloadQuestion2 AS win_DownloadQuestion

    win_DownloadQuestion.TitleBar := .F.
    win_DownloadQuestion.SysMenu  := .T.
    win_DownloadQuestion.Sizable  := .F.
	
#ENDIF


#IFDEF _HMG_3_

    LOAD WINDOW DownloadQuestion3 AS win_DownloadQuestion

#ENDIF


    SetProperty( "win_DownloadQuestion" , "btn_YES" , "Action" , { || win_DownloadQuestion_btn_YES() } )
    SetProperty( "win_DownloadQuestion" , "btn_NOT" , "Action" , { || win_DownloadQuestion_btn_NOT() } )

    SetProperty( "win_DownloadQuestion" , "lbl_0"   , "Value" , xlbl_0 )
    SetProperty( "win_DownloadQuestion" , "lbl_1"   , "Value" , "Pobraæ dane?" )


    ON KEY ALT+F4 OF win_DownloadQuestion ACTION { || NIL }


    AADD( aFrm , { "win_DownloadQuestion" , win_DownloadQuestion.Row , win_DownloadQuestion.Col } )

    win_DownloadQuestion.img_APPTitle.Picture  := "APP_MAIN"

    win_DownloadQuestion.Activate

  ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
#include "DownloadQuestion_Events.prg"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
