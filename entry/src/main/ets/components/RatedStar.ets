import { RatedStarBean } from '../bean/RatedStarBean'

@Component
export struct RatedStar {
  @ObjectLink ratedStarBean: RatedStarBean
  build() {
    Row() {
      if (this.ratedStarBean.maxLightIndex > this.ratedStarBean.currentIndex && this.ratedStarBean.maxLightIndex - this.ratedStarBean.currentIndex == 0.5) {
        Image(this.ratedStarBean.starHalfImageUrl).width(this.ratedStarBean.starWidth).height(this.ratedStarBean.starHeight)
      } else if (this.ratedStarBean.maxLightIndex > this.ratedStarBean.currentIndex) {
        Image(this.ratedStarBean.starFullImageUrl).width(this.ratedStarBean.starWidth).height(this.ratedStarBean.starHeight)
      } else {
        Image(this.ratedStarBean.starEmptyImageUrl).width(this.ratedStarBean.starWidth).height(this.ratedStarBean.starHeight)
      }
    }
  }
}