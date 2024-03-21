import { RatedStarBean } from '../bean/RatedStarBean'
import { RatedStar } from './RatedStar'


@Component
export struct RatingBar {
  @Prop @Watch('onStarChange') starNum: number = 0
  @State @Watch('onStarChange')LightIndex: number = 0
  @Watch('onStarChange')@Prop starFullImageUrl: ResourceStr | string = '' /*$r('app.media.full_star')*/
  @Watch('onStarChange')@Prop starHalfImageUrl: ResourceStr | string = '' /*$r('app.media.half_star')*/
  @Watch('onStarChange')@Prop starEmptyImageUrl: ResourceStr | string = '' /*$r('app.media.empty_star')*/
  @Watch('onStarChange')@Prop starHeight: number = 50
  @Watch('onStarChange')@Prop starWidth: number = 50
  @State @Watch('onStarChange') maxLightIndex: number = 0
  @State starsArr: RatedStarBean[] = []

  // setStar(starNum: number) {
  //   this.starNum = starNum
  // }

  onStarChange() {
    this.starsArr.length = 0
    for (let index = 0; index < this.starNum; index++) {
      this.starsArr.push(new RatedStarBean(this.starEmptyImageUrl, this.starHeight, this.starWidth))
    }
  }

  aboutToAppear(): void {
    this.onStarChange()
  }

  build() {
    Row() {
      ForEach(this.starsArr, (item: RatedStarBean, index) => {
        RatedStar({
          ratedStarBean: item,
          index: index,
          maxLightIndex: $maxLightIndex,
          starFullImageUrl: this.starFullImageUrl,
          starHalfImageUrl: this.starHalfImageUrl,
          starEmptyImageUrl: this.starEmptyImageUrl
        })
      })
    }.width('100%').justifyContent(FlexAlign.SpaceBetween)
  }
}