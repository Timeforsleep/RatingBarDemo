import { RatedStarBean } from '../bean/RatedStarBean'

@Component
export struct RatedStar {
  @ObjectLink RatedStarBean: RatedStarBean

  build() {
    Row() {
      Image($r('app.media.empty_star')).width(this.RatedStarBean.starWidth).height(this.RatedStarBean.starHeight)
        .gesture(
          TapGesture().onAction((event:Gesture))
      )
    }
  }
}