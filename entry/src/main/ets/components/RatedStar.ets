import { RatedStarBean } from '../bean/RatedStarBean'

@Component
export struct RatedStar {
  starFullImageUrl: ResourceStr | string = ''
  starHalfImageUrl: ResourceStr | string = ''
  starEmptyImageUrl: ResourceStr | string = ''

  aboutToAppear(): void {
    console.log(`gyk${this.starFullImageUrl}`);
  }

  // @Prop starImageUrl:ResourceStr|string
  // @Prop starWidth:number
  // @Prop starHeight:number
  @ObjectLink ratedStarBean: RatedStarBean /*= new RatedStarBean(this.starImageUrl,this.starHeight,this.starWidth)*/
  build() {
    Row() {
      Image(this.ratedStarBean.starImageUrl).width(this.ratedStarBean.starWidth).height(this.ratedStarBean.starHeight)
        .gesture(
          TapGesture().onAction((event: GestureEvent) => {
            this.ratedStarBean.starImageUrl = this.starFullImageUrl
          })
        )
    }
  }
}