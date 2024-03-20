import { RatedStarBean } from '../bean/RatedStarBean'
import { RatedStar } from './RatedStar'

@Component
export struct RatingBar {
  //数组内元素变化不会被监听到
  starNum: number = 5
  starFullImageUrl: ResourceStr | string = ''
  starHalfImageUrl: ResourceStr | string = ''
  starEmptyImageUrl: ResourceStr | string = ''
  starHeight: number = 50
  starWidth: number = 50
  starsArr: RatedStarBean[] = new Array(this.starNum).fill(new RatedStarBean(this.starEmptyImageUrl, this.starHeight, this.starWidth))

  build() {
    Row() {
      ForEach(this.starsArr, (item: RatedStarBean, index) => {
        RatedStar({ RatedStarBean: item })
      })
    }.width('100%').justifyContent(FlexAlign.SpaceBetween)
  }
}