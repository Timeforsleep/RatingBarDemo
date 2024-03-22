import { RatedStarBean } from '../bean/RatedStarBean'
import { RatedStar } from './RatedStar'


@Component
export struct RatingBar {
  @Prop @Watch('onStarNumChange') starNum: number = 0
  @Prop @Watch('onStarParamsChange')starFullImageUrl: ResourceStr | string = '' /*$r('app.media.full_star')*/
  @Prop @Watch('onStarParamsChange')starHalfImageUrl: ResourceStr | string = '' /*$r('app.media.half_star')*/
  @Prop @Watch('onStarParamsChange')starEmptyImageUrl: ResourceStr | string = '' /*$r('app.media.empty_star')*/
  @Prop @Watch('onStarParamsChange')starHeight: number = 50
  @Prop @Watch('onStarParamsChange')starWidth: number = 50
  @Prop @Watch('onStarParamsChange') maxLightIndex: number = 0
  @State starsArr: RatedStarBean[] = []

  onStarNumChange() {
    this.starsArr.length = 0
    for (let index = 0; index < this.starNum; index++) {
      this.starsArr.push(new RatedStarBean(this.starEmptyImageUrl,
        this.starHeight,
        this.starWidth,
        this.starFullImageUrl,
        this.starHalfImageUrl,
        this.starEmptyImageUrl,
        this.maxLightIndex,
        index))
    }
  }

  onStarParamsChange() {
    this.onStarNumChange()
    for (let index = 0; index < this.starsArr.length; index++) {
      let currentStar = this.starsArr[index]
      currentStar.starHeight = this.starHeight
      currentStar.starWidth = this.starWidth
      currentStar.starFullImageUrl = this.starFullImageUrl
      currentStar.starHalfImageUrl = this.starHalfImageUrl
      currentStar.starEmptyImageUrl = this.starEmptyImageUrl
      currentStar.maxLightIndex = this.maxLightIndex
    }
  }

  aboutToAppear(): void {
    this.onStarNumChange()
  }

  build() {
    Row() {
      ForEach(this.starsArr, (item: RatedStarBean, index) => {
        RatedStar({
          ratedStarBean: item
        }).onClick((event: ClickEvent) => {
          let tapMessage = event
          if (tapMessage != null && tapMessage.x < item.starWidth / 2) {
            item.maxLightIndex = item.currentIndex + 0.5
          } else {
            item.maxLightIndex = item.currentIndex + 1
          }
          this.maxLightIndex = item.maxLightIndex
        })
      })
    }.width('100%').justifyContent(FlexAlign.SpaceBetween)
  }
}