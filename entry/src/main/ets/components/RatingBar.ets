import { RatedStarBean } from '../bean/RatedStarBean'
import { RatedStar } from './RatedStar'


@Component
export struct RatingBar {
  @Prop @Watch('onStarNumChange') starNum: number = 0
  // @State @Watch('onStarChange')LightIndex: number = 0
  /* @Watch('onStarParamsChange') */
  @Prop starFullImageUrl: ResourceStr | string = '' /*$r('app.media.full_star')*/
  /* @Watch('onStarParamsChange') */
  @Prop starHalfImageUrl: ResourceStr | string = '' /*$r('app.media.half_star')*/
  /* @Watch('onStarParamsChange') */
  @Prop starEmptyImageUrl: ResourceStr | string = '' /*$r('app.media.empty_star')*/
  /* @Watch('onStarParamsChange') */
  @Prop starHeight: number = 50
  /* @Watch('onStarParamsChange') */
  @Prop starWidth: number = 50
  @State @Watch('onStarParamsChange') maxLightIndex: number = 0
  @State starsArr: RatedStarBean[] = []

  // setStar(starNum: number) {
  //   this.starNum = starNum
  // }

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
    console.log('执行！')
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
        // if (this.maxLightIndex > this.index && this.maxLightIndex - this.index == 0.5)
        // if (item.maxLightIndex > index && item.maxLightIndex - index == 0.5) {
        //   item.starImageUrl = item.starHalfImageUrl
        // }
        RatedStar({
          ratedStarBean: item
          // index: index,
          // maxLightIndex: $maxLightIndex,
          // starFullImageUrl: this.starFullImageUrl,
          // starHalfImageUrl: this.starHalfImageUrl,
          // starEmptyImageUrl: this.starEmptyImageUrl
        }).onClick((event: ClickEvent) => {
          let tapMessage = event
          if (tapMessage != null && tapMessage.x < item.starWidth / 2) {
            item.maxLightIndex = item.currentIndex + 0.5
          } else {
            item.maxLightIndex = item.currentIndex + 1
          }
          this.maxLightIndex = item.maxLightIndex
          // item.maxLightIndex = Math.max(item.currentIndex,this.maxLightIndex)
        })
      })
    }.width('100%').justifyContent(FlexAlign.SpaceBetween)
  }
}