import { RatedStarBean } from '../bean/RatedStarBean'

@Component
export struct RatedStar {
  // starFullImageUrl: ResourceStr | string = ''
  // starHalfImageUrl: ResourceStr | string = ''
  // starEmptyImageUrl: ResourceStr | string = ''
  // index: number = 0
  // @Link maxLightIndex: number
  // @Prop starImageUrl:ResourceStr|string
  // @Prop starWidth:number
  // @Prop starHeight:number
  @ObjectLink ratedStarBean: RatedStarBean /*= new RatedStarBean(this.starImageUrl,this.starHeight,this.starWidth)*/

  build() {
    Row() {
      if (this.ratedStarBean.maxLightIndex > this.ratedStarBean.currentIndex && this.ratedStarBean.maxLightIndex - this.ratedStarBean.currentIndex == 0.5) {
        Image(this.ratedStarBean.starHalfImageUrl).width(this.ratedStarBean.starWidth).height(this.ratedStarBean.starHeight)
      } else if (this.ratedStarBean.maxLightIndex > this.ratedStarBean.currentIndex) {
        Image(this.ratedStarBean.starFullImageUrl).width(this.ratedStarBean.starWidth).height(this.ratedStarBean.starHeight)
          // .onClick((event: ClickEvent) => {
          //   let tapMessage = event
          //   if (tapMessage != null && tapMessage.x < this.ratedStarBean.starWidth / 2) {
          //     this.ratedStarBean.maxLightIndex = this.ratedStarBean.currentIndex + 0.5
          //   } else {
          //     this.ratedStarBean.maxLightIndex = this.ratedStarBean.currentIndex + 1
          //   }
          // })
      } else {
        Image(this.ratedStarBean.starEmptyImageUrl).width(this.ratedStarBean.starWidth).height(this.ratedStarBean.starHeight)
        //   .onClick((event: ClickEvent) => {
        //     let tapMessage = event
        //     if (tapMessage != null && tapMessage.x < this.ratedStarBean.starWidth / 2) {
        //       this.ratedStarBean.maxLightIndex = this.ratedStarBean.currentIndex + 0.5
        //     } else {
        //       this.ratedStarBean.maxLightIndex = this.ratedStarBean.currentIndex + 1
        //     }
        //   })
      }
    }
  }
}