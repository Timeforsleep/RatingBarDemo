import { RatedStarBean } from '../bean/RatedStarBean'

@Component
export struct RatedStar {
  starFullImageUrl: ResourceStr | string = ''
  starHalfImageUrl: ResourceStr | string = ''
  starEmptyImageUrl: ResourceStr | string = ''
  index: number = 0
  @Link maxLightIndex: number
  // @Prop starImageUrl:ResourceStr|string
  // @Prop starWidth:number
  // @Prop starHeight:number
  @ObjectLink ratedStarBean: RatedStarBean /*= new RatedStarBean(this.starImageUrl,this.starHeight,this.starWidth)*/

  build() {
    Row() {
      if (this.maxLightIndex > this.index && this.maxLightIndex - this.index == 0.5) {
        Image(this.starHalfImageUrl).width(this.ratedStarBean.starWidth).height(this.ratedStarBean.starHeight)
          .onClick((event: ClickEvent) => {
            let tapMessage = event
            if (tapMessage != null && tapMessage.x < this.ratedStarBean.starWidth / 2) {
              this.maxLightIndex = this.index + 0.5
            } else {
              this.maxLightIndex = this.index + 1
            }
          })
      } else if (this.maxLightIndex > this.index) {
        Image(this.starFullImageUrl).width(this.ratedStarBean.starWidth).height(this.ratedStarBean.starHeight)
          .onClick((event: ClickEvent) => {
            let tapMessage = event
            if (tapMessage != null && tapMessage.x < this.ratedStarBean.starWidth / 2) {
              this.maxLightIndex = this.index + 0.5
            } else {
              this.maxLightIndex = this.index + 1
            }
          })
      } else {
        Image(this.starEmptyImageUrl).width(this.ratedStarBean.starWidth).height(this.ratedStarBean.starHeight)
          .onClick((event: ClickEvent) => {
            let tapMessage = event
            if (tapMessage != null && tapMessage.x < this.ratedStarBean.starWidth / 2) {
              this.maxLightIndex = this.index + 0.5
            } else {
              this.maxLightIndex = this.index + 1
            }
          })
      }
    }
  }
}