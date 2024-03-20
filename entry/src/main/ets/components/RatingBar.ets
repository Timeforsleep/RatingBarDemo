import { RatedStarBean } from '../bean/RatedStarBean'
import { RatedStar } from './RatedStar'

@Component
@Entry
export struct RatingBar {
  starNum: number = 0
  starFullImageUrl: ResourceStr | string = '' /*$r('app.media.full_star')*/
  starHalfImageUrl: ResourceStr | string = '' /*$r('app.media.half_star')*/
  starEmptyImageUrl: ResourceStr | string = '' /*$r('app.media.empty_star')*/
  starHeight: number = 50
  starWidth: number = 50
  starsArr: RatedStarBean[] = []

  aboutToAppear(): void {
    for (let index = 0; index < this.starNum; index++) {
      this.starsArr.push(new RatedStarBean(this.starEmptyImageUrl, this.starHeight, this.starWidth/*, this.starFullImageUrl, this.starHalfImageUrl, this.starEmptyImageUrl*/))
    }
  }

  build() {
    Row() {
      ForEach(this.starsArr, (item: RatedStarBean, index) => {
        RatedStar({
          ratedStarBean: item,
          starFullImageUrl: this.starFullImageUrl,
          starEmptyImageUrl: this.starEmptyImageUrl,
          starHalfImageUrl: this.starHalfImageUrl
        })
      })
    }.width('100%').justifyContent(FlexAlign.SpaceBetween)
  }
}