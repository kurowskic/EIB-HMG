*-----------------------------------------------------------------------------*
#include "eib_hmg.ch"
*-----------------------------------------------------------------------------*


*------------------------------------------------------------------------------*
PROCEDURE Show_TitleBar()
*------------------------------------------------------------------------------*

  LOCAL hDC
  LOCAL BTstruct
  
  LOCAL nTypeText
  LOCAL nAlingText
  LOCAL nOrientation
  
  LOCAL hBMP

//  LOCAL nWidth  := BT_ClientAreaWidth  ( "win_Main" )
//  LOCAL nHeight := BT_ClientAreaHeight ( "win_Main" )


  hDC = BT_CreateDC( "win_Main" , BT_HDC_INVALIDCLIENTAREA , @BTstruct )

  nTypeText    := BT_TEXT_TRANSPARENT
  nAlingText   := BT_TEXT_LEFT + BT_TEXT_TOP
  nOrientation := 0

  BT_DrawText ( hDC , 2 , 45 , NAZWA_PR , fARIAL , 20 , WHITE , BLUE , nTypeText , nAlingText , nOrientation )
  
  BT_DrawText ( hDC , 2 , 540 , STR( LEN( aDataBase ) ) , fCOURIER , 20 , BLACK , BLUE , nTypeText , nAlingText , nOrientation )

  BT_DrawText ( hDC , 2 , 820 , GetDateFile() , fCOURIER , 20 , BLACK , BLUE , nTypeText , nAlingText , nOrientation )


  hBMP :=  BT_BitmapLoadFile ( "APP_MAIN" )
  BT_DrawBitMap( hDC , 2 , 2 , 32, 32 , BT_SCALE , hBMP )

  BT_BitmapRelease( hBMP )
  BTstruct [1] := BT_HDC_ALLCLIENTAREA

  BT_DeleteDC( BTstruct )

RETURN
*------------------------------------------------------------------------------*
