import SwiftUI
import SDWebImageSwiftUI

struct CommonReviewRow: View {
    let review: ReviewProfile
    let accountTapAction: (_ profile: Profile) -> Void
    let imageTapAction: (_ url: URL?) -> Void
    let menuTapAction: (_ review: ReviewProfile) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 12) {
                Button {
                    accountTapAction(review.profile)
                } label: {
                    WebImage(url: URL(string: review.profileImageUrlString)) { image in
                        image.resizable()
                    } placeholder: {
                        Rectangle().foregroundColor(Color(.appBackground))
                    }
                    .transition(.fade(duration: 0.5))
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                }

                VStack(alignment: .leading, spacing: 4) {
                    Button(action: {
                        accountTapAction(review.profile)
                        }, label: {
                            CommonText(text: review.profile.nickname, font: .mPlus2Medium(size: 14), lineHeight: 18)
                                .foregroundStyle(Color(.appMainText))
                        })
                    CommonText(text: review.createdAtString, font: .mPlus2Regular(size: 14), lineHeight: 18)
                        .foregroundStyle(Color(.appMainText))
                }

                Spacer()

                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.appMain)

                    Image(systemName: review.rate > 1 ? "star.fill" : "star")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.appMain)

                    Image(systemName: review.rate > 2 ? "star.fill" : "star")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.appMain)

                    Image(systemName: review.rate > 3 ? "star.fill" : "star")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.appMain)

                    Image(systemName: review.rate > 4 ? "star.fill" : "star")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.appMain)
                }
            }

            if review.comment.isNotEmpty {
                CommonText(
                    text: review.comment,
                    font: .mPlus2Regular(size: 14),
                    lineHeight: 20,
                    alignment: .leading
                )
                .foregroundStyle(Color(.appMainText))
                .padding(.top, 12)
            }

            // 画像
            if review.imageUrls.count == 4 {
                VStack(spacing: 4) {
                    HStack(spacing: 4) {
                        Button {
                            imageTapAction(review.imageUrls[0])
                        } label: {
                            ReviewListRowImage(url: review.imageUrls[0])
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .clipped()
                        }

                        Button {
                            imageTapAction(review.imageUrls[1])
                        } label: {
                            ReviewListRowImage(url: review.imageUrls[1])
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .clipped()
                        }
                    }

                    HStack(spacing: 4) {
                        Button {
                            imageTapAction(review.imageUrls[2])
                        } label: {
                            ReviewListRowImage(url: review.imageUrls[2])
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .clipped()
                        }

                        Button {
                            imageTapAction(review.imageUrls[3])
                        } label: {
                            ReviewListRowImage(url: review.imageUrls[3])
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .clipped()
                        }
                    }
                }
                .padding(.top, 12)
            } else if review.imageUrls.count == 3 {
                HStack(spacing: 4) {
                    Button {
                        imageTapAction(review.imageUrls[0])
                    } label: {
                        ReviewListRowImage(url: review.imageUrls[0])
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 204)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .clipped()
                    }

                    VStack(spacing: 4) {
                        Button {
                            imageTapAction(review.imageUrls[1])
                        } label: {
                            ReviewListRowImage(url: review.imageUrls[1])
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .clipped()
                        }

                        Button {
                            imageTapAction(review.imageUrls[2])
                        } label: {
                            ReviewListRowImage(url: review.imageUrls[2])
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .frame(height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .clipped()
                        }
                    }
                }
                .padding(.top, 12)
            } else if review.imageUrls.count == 2 {
                HStack(spacing: 4) {
                    Button {
                        imageTapAction(review.imageUrls[0])
                    } label: {
                        ReviewListRowImage(url: review.imageUrls[0])
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .clipped()
                    }

                    Button {
                        imageTapAction(review.imageUrls[1])
                    } label: {
                        ReviewListRowImage(url: review.imageUrls[1])
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .clipped()
                    }
                }
                .padding(.top, 12)
            } else if review.imageUrls.count == 1 {
                Button {
                    imageTapAction(review.imageUrls[0])
                } label: {
                    ReviewListRowImage(url: review.imageUrls[0])
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .clipped()
                }
                .padding(.top, 12)
            }

            if let merchandise = review.merchandise {
                CommonText(
                    text: "商品名: \(merchandise.name)",
                    font: .mPlus2Regular(size: 14),
                    lineHeight: 20,
                    alignment: .leading
                )
                .foregroundStyle(Color(.appMainText))
                .padding(.top, 12)
            } else {
                CommonText(
                    text: "JANコード: \(review.code)",
                    font: .mPlus2Regular(size: 14),
                    lineHeight: 20,
                    alignment: .leading
                )
                .foregroundStyle(Color(.appMainText))
                .padding(.top, 12)
            }

            HStack(spacing: 0) {
                Spacer()
                Button {
                    menuTapAction(review)
                } label: {
                    Image(systemName: "ellipsis")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color(.appSubText))
                }
            }
            .padding(.top, 12)

        }
        .padding(.top, 12)
        .padding(.leading, 12)
        .padding(.trailing, 12)
        .padding(.bottom, 12)
        //        VStack(spacing: 0) {
        //            HStack(spacing: 16) {
        //                VStack(spacing: 8) {
        //                    HStack(spacing: 0) {
        //                        Text(title)
        //                            .font(.system(size: 14))
        //                            .foregroundStyle(Color(.appMainText))
        //                        Spacer()
        //                        Text("23 / 76")
        //                            .font(.system(size: 14))
        //                            .foregroundStyle(Color(.appMainText))
        //                    }
        //
        //                    GeometryReader { geometry in
        //                        ZStack(alignment: .leading) {
        //                            RoundedRectangle(cornerRadius: 4.0)
        //                                .foregroundStyle(Color(.appBackground))
        //                                .frame(height: 8)
        //                                .frame(width: geometry.size.width)
        //
        //                            RoundedRectangle(cornerRadius: 4.0)
        //                                .foregroundStyle(Color(.appRedBackground))
        //                                .frame(height: 8)
        //                                .frame(width: geometry.size.width * 0.8)
        //
        //                            RoundedRectangle(cornerRadius: 4.0)
        //                                .foregroundStyle(Color(.appBlueBackground))
        //                                .frame(height: 8)
        //                                .frame(width: geometry.size.width * 0.7)
        //
        //                            RoundedRectangle(cornerRadius: 4.0)
        //                                .foregroundStyle(Color(.appGreenBackground))
        //                                .frame(height: 8)
        //                                .frame(width: geometry.size.width * 0.2)
        //                        }
        //                        .frame(minWidth: 0, maxWidth: .infinity)
        //                    }
        //                }
        //
        //                Image(systemName: "chevron.forward")
        //                    .resizable()
        //                    .scaledToFit()
        //                    .frame(width: 9)
        //            }
        //            .padding(.top, 16)
        //            .padding(.horizontal, 16)
        //            .padding(.bottom, 16)
        //
        //            Divider()
        //        }
    }
}

// #Preview {
//    ReviewListViewRow(title: "基礎理論")
// }
