*-----------------------------------------------------------------------------*
#include "eib_hmg.ch"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
PROCEDURE DownloadQuestion( xlbl_0 )
*-----------------------------------------------------------------------------*

  MEMVAR lbl_BackGround
  MEMVAR img_APPTitle
  MEMVAR lbl_APPTitle
  MEMVAR frm_Main
  MEMVAR lbl_0
  MEMVAR lbl_1
  MEMVAR btn_YES
  MEMVAR btn_NOT

  PRIVATE lbl_BackGround
  PRIVATE img_APPTitle
  PRIVATE lbl_APPTitle
  PRIVATE frm_Main
  PRIVATE lbl_0
  PRIVATE lbl_1
  PRIVATE btn_YES
  PRIVATE btn_NOT


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


    SetProperty( "win_DownloadQuestion" , "btn_YES" , "Action" , { || win_DDownloadQuestion_btn_YES() } )
    SetProperty( "win_DownloadQuestion" , "btn_NOT" , "Action" , { || win_DDownloadQuestion_btn_NOT() } )

    SetProperty( "win_DownloadQuestion" , "lbl_0"   , "Value" , xlbl_0 )
    SetProperty( "win_DownloadQuestion" , "lbl_1"   , "Value" , "Pobraæ dane?" )

    ON KEY ALT+F4 OF win_DownloadQuestion ACTION { || NIL }


#IFDEF _HMG_2_

    win_DownloadQuestion.Row := ( APP_ROW + ( APP_HEIGHT - win_DownloadQuestion.Height ) / 2 )
    win_DownloadQuestion.Col := ( APP_COL + ( APP_WIDTH  - win_DownloadQuestion.Width  ) / 2 )

#ENDIF


    AADD( aFrm , { "win_DownloadQuestion" , win_DownloadQuestion.Row , win_DownloadQuestion.Col } )

    CTK_DrawBorder( "win_DownloadQuestion" )

    win_DownloadQuestion.Activate

  ENDIF


RETURN
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
#include "DownloadQuestion_Events.prg"
*-----------------------------------------------------------------------------*


*-----------------------------------------------------------------------------*
*-----------------------------------------------------------------------------*
