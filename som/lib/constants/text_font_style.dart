import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../gen/colors.gen.dart';

class TextFontStyle {
//Initialising Constractor
  TextFontStyle._();

  // New Styles

  static final headline32StylePlayFairSemiBold = GoogleFonts.playfairDisplay(
      color: AppColors.cFFFFFF, fontSize: 32.sp, fontWeight: FontWeight.w600);
  static final headline24w400nanumMyeongjo = GoogleFonts.nanumMyeongjo(
      color: AppColors.cE2E2E3, fontSize: 24.sp, fontWeight: FontWeight.w400);
  static final headline16w600OpenSans = GoogleFonts.openSans(
      color: AppColors.cE2E2E3, fontSize: 16.sp, fontWeight: FontWeight.w600);
  static final headline16w400OpenSans = GoogleFonts.openSans(
      color: AppColors.cFFFFFF, fontSize: 16.sp, fontWeight: FontWeight.w400);
  static final headline13w400OpenSans = GoogleFonts.openSans(
      color: AppColors.c97A0AF, fontSize: 13.sp, fontWeight: FontWeight.w400);

  static final headline20StyleOpenSansBold = GoogleFonts.openSans(
      color: AppColors.c22252D, fontSize: 20.sp, fontWeight: FontWeight.w700);

  static final headline26StyleNanumMyeongjoRegular = GoogleFonts.nanumMyeongjo(
      color: AppColors.c0A0909, fontSize: 26.sp, fontWeight: FontWeight.w400);

  static final headline30StyleNanumMyeongjoRegular = GoogleFonts.nanumMyeongjo(
      color: AppColors.c0A0909, fontSize: 30.sp, fontWeight: FontWeight.w400);

  static final headline60StyleNanumMyeongjoRegular = GoogleFonts.nanumMyeongjo(
      color: AppColors.c0A0909, fontSize: 60.sp, fontWeight: FontWeight.w400);

  static final headline14StyleOpenSansBold = GoogleFonts.openSans(
      decoration: TextDecoration.underline,
      color: AppColors.cED4A4A4A,
      fontSize: 14.sp,
      fontWeight: FontWeight.w700);

  static final headline16StyleOpenSansBold = GoogleFonts.openSans(
      color: AppColors.c4A4A4A, fontSize: 16.sp, fontWeight: FontWeight.w700);

  static final headline16StyleOpenSansMedium = GoogleFonts.openSans(
      color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.w500);

  static final headline14StyleOpenSansRegular = GoogleFonts.openSans(
      color: AppColors.c4A4A4A, fontSize: 14.sp, fontWeight: FontWeight.w400);

  static final headline24StyleOpenSansSemiBold = GoogleFonts.openSans(
      color: AppColors.c22252D, fontSize: 24.sp, fontWeight: FontWeight.w600);

  // New styles

  static final headline30StyleManropeTextBold700 = GoogleFonts.manrope(
    color: AppColors.c22252D,
    fontSize: 30.sp,
    fontWeight: FontWeight.w700, // Bold
  );

  static final headline16StyleManropeTextBold700 = GoogleFonts.manrope(
    color: AppColors.c22252D,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700, // Bold
  );
  static final headline16StyleManropeTextBold500 = GoogleFonts.manrope(
    color: AppColors.c22252D,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500, // Bold
  );
  static final headline18StyleManropeTextBold = GoogleFonts.manrope(
    color: AppColors.headLine1Color,
    fontSize: 18.sp,
    fontWeight: FontWeight.w400, // Bold
  );
  static final headline28StyleManropeTextBold = GoogleFonts.manrope(
    color: AppColors.c22252D,
    fontSize: 28.sp,
    fontWeight: FontWeight.w700, // Bold
  );

  static final headline16StyleOpenSansTextBold700 = GoogleFonts.openSans(
    color: AppColors.c22252D,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700, // Bold
    height: 21 / 16,
  );

  static final headline16StyleOpenSansTextSemiBold = GoogleFonts.openSans(
    color: AppColors.c22252D,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600, // Semi Bold
    height: 21 / 16,
  );

  static final headline16StyleOpenSansTextRegular400Color22252D =
      GoogleFonts.openSans(
    color: AppColors.c22252D,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400, // Regular
    height: 21 / 16,
  );

  static final headline14StyleOpenSansTextRegular400 = GoogleFonts.openSans(
    color: AppColors.c4A4A4A,
    fontSize: 14.sp,
    height: 23 / 14,
    fontWeight: FontWeight.w400, // Regular
  );

  static final headline1StyleOpenSansTextRegular400 = GoogleFonts.openSans(
    color: AppColors.c4A4A4A,
    fontSize: 14.sp,
    height: 23 / 14,
    fontWeight: FontWeight.w400, // Regular
  );

  static final headline20StyleOpenSansTextRegular700 = GoogleFonts.openSans(
    color: AppColors.c4A4A4A,
    fontSize: 20.sp,
    height: 23 / 14,
    fontWeight: FontWeight.w700, // Regular
  );

  static final headline24StyleOpenSansTextBold700 = GoogleFonts.openSans(
    color: AppColors.cdfe1e6,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700, // Bold
    height: 32 / 24,
  );
  static final headline14StyleOpenSansTextBold400Color22252D =
      GoogleFonts.openSans(
    color: AppColors.c22252D,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400, // Bold
    height: 32 / 24,
  );
  static final headline24StyleOpenSansTextBold700Color22252D =
      GoogleFonts.openSans(
    color: AppColors.c22252D,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700, // Bold
    height: 32 / 24,
  );

  static final headline14StyleOpenSansTextMedium500 = GoogleFonts.openSans(
    color: AppColors.cdfe1e6,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500, // Medium
  );
  static final headline14StyleOpenSansTextMediumw500 = GoogleFonts.openSans(
    color: AppColors.c22252D,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500, // Medium
  );

  static final headline14StyleOpenSansTextRegular400Color22252D =
      GoogleFonts.openSans(
    color: AppColors.c22252D,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400, // Regular
    height: 20 / 12,
  );

  static final headline14StyleOpenSansTextBold700 = GoogleFonts.openSans(
    color: AppColors.c0076ec,
    fontSize: 14.sp,
    height: 20 / 12,
    fontWeight: FontWeight.w700, // Bold
  );

  static final headline12StyleOpenSansTextw700 = GoogleFonts.openSans(
    color: AppColors.c22252D,
    fontSize: 12.sp,
    height: 20 / 12,
    fontWeight: FontWeight.w700, // Bold
  );
  static final headline12StyleOpenSansTextBold700 = GoogleFonts.openSans(
    color: AppColors.c0076ec,
    fontSize: 12.sp,
    height: 20 / 12,
    fontWeight: FontWeight.w700, // Bold
    decoration: TextDecoration.underline,
  );

  static final headline12StyleOpenSansTextSemiBold600 = GoogleFonts.openSans(
    color: AppColors.cFFFFFF,
    fontSize: 12.sp,
    height: 20 / 12,
    fontWeight: FontWeight.w600, // Semi Bold
    decoration: TextDecoration.underline,
  );

  static final headline12StyleOpenSansTextRegular400 = GoogleFonts.openSans(
    color: AppColors.c22252D,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400, // Regular
    height: 20 / 12,
  );

  static final headline16StyleOpenSansTextRegular400 = GoogleFonts.openSans(
    fontSize: 16.sp,
    color: AppColors.c8993a4,
    fontWeight: FontWeight.w400, // Regular
  );

  static final headline16StyleOpenSansTextBold700ColorWhite =
      GoogleFonts.openSans(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700, // Bold
    color: Colors.white,
  );

  static final headline12StyleOpenSansTextBold400Color4A4A4A =
      GoogleFonts.openSans(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400, // Bold
    color: AppColors.c4A4A4A,
  );
  static final headline12StyleOpenSansTextBold400Color8993A4 =
      GoogleFonts.openSans(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400, // Bold
    color: AppColors.c8993A4,
  );
  static final headline14StyleOpenSansTextBold400Color4A4A4A =
      GoogleFonts.openSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400, // Bold
    color: AppColors.c4A4A4A,
  );
  static final headline14StyleOpenSansTextBold400Color8993A4 =
      GoogleFonts.openSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400, // Bold
    color: AppColors.c8993A4,
  );
  static final headline14StyleOpenSansTextBold400ColorC00C9E4 =
      GoogleFonts.openSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400, // Bold
    color: AppColors.c00C9E4,
  );

  static final headline16StyleOpenSansTextBold700Color4A4A4A =
      GoogleFonts.openSans(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700, // Bold
    color: AppColors.c4A4A4A,
  );
  static final headline16StyleOpenSansTextBold700Color22252D =
      GoogleFonts.openSans(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700, // Bold
    color: AppColors.c22252D,
  );

  static final headline18StyleOpenSansTextRegular400 = GoogleFonts.openSans(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400, // Regular
    color: AppColors.c4A4A4A,
  );

  static final headline17StyleOpenSansTextRegularc4A4A4A = GoogleFonts.openSans(
    fontSize: 17.sp,
    fontWeight: FontWeight.w400, // Regular
    color: AppColors.c4A4A4A,
  );
  static final headline20StyleOpenSansTextRegular400 = GoogleFonts.openSans(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400, // Regular
    color: AppColors.c4A4A4A,
  );

  static final headline18StyleOpenSansTextBold700 = GoogleFonts.openSans(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700, // Bold
    color: AppColors.c22252D,
  );

  static final headline32StyleOpenSansTextBold700 = GoogleFonts.openSans(
    fontSize: 26.sp,
    fontWeight: FontWeight.w700, // Bold
    color: AppColors.c22252D,
  );

  //Existing Styles
  static final headline50StyleMontserrat = GoogleFonts.montserrat(
      color: AppColors.cFFFFFF, fontSize: 50.sp, fontWeight: FontWeight.w400);

  static final headline27StyleMontserrat = GoogleFonts.montserrat(
      color: AppColors.c0A0909, fontSize: 27.sp, fontWeight: FontWeight.w600);
  static final headline20StyleMontserrat = GoogleFonts.montserrat(
      color: AppColors.c0A0909, fontSize: 20.sp, fontWeight: FontWeight.w700);
  static final headline19StyleMontserrat = GoogleFonts.montserrat(
      color: AppColors.c0A0909, fontSize: 19.sp, fontWeight: FontWeight.w600);
  static final headline18StyleMontserrat = GoogleFonts.montserrat(
      color: AppColors.c0A0909, fontSize: 18.sp, fontWeight: FontWeight.w600);
  static final headline18StyleMontserrat400 = GoogleFonts.montserrat(
      color: AppColors.c0A0909, fontSize: 18.sp, fontWeight: FontWeight.w400);
  static final headline17StyleMontserrat = GoogleFonts.montserrat(
      color: AppColors.c0A0909, fontSize: 17.sp, fontWeight: FontWeight.w700);
  static final headline16StyleMontserrat = GoogleFonts.montserrat(
      color: AppColors.cFFFFFF, fontSize: 16.sp, fontWeight: FontWeight.w400);
  static final headline16StyleMontserrat500 = GoogleFonts.montserrat(
      color: AppColors.cFFFFFF, fontSize: 16.sp, fontWeight: FontWeight.w500);
  static final headline16StyleMontserrat600 = GoogleFonts.montserrat(
      color: AppColors.c0A0909, fontSize: 16.sp, fontWeight: FontWeight.w600);
  static final headline15StyleMontserrat = GoogleFonts.montserrat(
      color: AppColors.cFFFFFF, fontSize: 15.sp, fontWeight: FontWeight.w400);
  static final headline14StyleMontserrat = GoogleFonts.montserrat(
      color: AppColors.c000000, fontSize: 14.sp, fontWeight: FontWeight.bold);
  static final headline13StyleMontserrat = GoogleFonts.montserrat(
      color: AppColors.cFFFFFF, fontSize: 13.sp, fontWeight: FontWeight.w400);
  static final headline13StyleMontserrat600 = GoogleFonts.montserrat(
      color: AppColors.cFFFFFF, fontSize: 13.sp, fontWeight: FontWeight.w600);
  static final headline12StyleMontserrat = GoogleFonts.montserrat(
      color: AppColors.cFFFFFF, fontSize: 12.sp, fontWeight: FontWeight.normal);
  static final headline12StyleMontserrat400 = GoogleFonts.montserrat(
      color: AppColors.cFFFFFF, fontSize: 12.sp, fontWeight: FontWeight.w400);
  static final headline12StyleMontserrat500 = GoogleFonts.montserrat(
      color: AppColors.c969696, fontSize: 12.sp, fontWeight: FontWeight.w500);
  static final headline12StyleMontserratw500 = GoogleFonts.montserrat(
      color: AppColors.c8993A4, fontSize: 12.sp, fontWeight: FontWeight.w500);
  static final headline11StyleMontserrat = GoogleFonts.montserrat(
      color: AppColors.cFFFFFF, fontSize: 11.sp, fontWeight: FontWeight.normal);
  static final headline10StyleMontserrat = GoogleFonts.montserrat(
      color: AppColors.cFFFFFF, fontSize: 10.sp, fontWeight: FontWeight.w400);
  static final headline10StyleMontserrat600 = GoogleFonts.montserrat(
      color: AppColors.cFFFFFF, fontSize: 10.sp, fontWeight: FontWeight.w600);
  static final headline9StyleMontserrat = GoogleFonts.montserrat(
      color: AppColors.cFFFFFF, fontSize: 9.sp, fontWeight: FontWeight.w400);
  static final headline9StyleMontserrat700 = GoogleFonts.montserrat(
      color: AppColors.cFEFFFE, fontSize: 9.sp, fontWeight: FontWeight.w700);
  static final headline8StyleMontserrat = GoogleFonts.montserrat(
      color: AppColors.cFFFFFF, fontSize: 8.sp, fontWeight: FontWeight.w400);
  static final headline7StyleMontserrat = GoogleFonts.montserrat(
      color: AppColors.cFFFFFF, fontSize: 7.sp, fontWeight: FontWeight.bold);
  static final headline14StyleMontserrat300 = GoogleFonts.montserrat(
      color: AppColors.cFFFFFF, fontSize: 14.sp, fontWeight: FontWeight.w300);
  static final headline14StyleMontserrat400 = GoogleFonts.montserrat(
      color: AppColors.c0A0909, fontSize: 14.sp, fontWeight: FontWeight.w400);
  static final headline14StyleMontserrat500 = GoogleFonts.montserrat(
      color: AppColors.c0A0909, fontSize: 14.sp, fontWeight: FontWeight.w500);
  static final headline14StyleMontserrat600 = GoogleFonts.montserrat(
      color: AppColors.c0A0909, fontSize: 14.sp, fontWeight: FontWeight.w600);
}
