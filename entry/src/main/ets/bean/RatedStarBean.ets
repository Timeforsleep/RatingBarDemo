@Observed
export class RatedStarBean {
  starImageUrl: ResourceStr | string = ''
  starHeight: number = 50
  starWidth: number = 50
  // starFullImageUrl: ResourceStr | string = ''
  // starHalfImageUrl: ResourceStr | string = ''
  // starEmptyImageUrl: ResourceStr | string = ''

  constructor(starImageUrl: ResourceStr | string,
              starHeight: number,
              starWidth: number
              /*starFullImageUrl: ResourceStr | string,
              starHalfImageUrl: ResourceStr | string = '',
              starEmptyImageUrl: ResourceStr | string = ''*/
  ) {
    this.starImageUrl = starImageUrl
    this.starHeight = starHeight
    this.starWidth = starWidth
    // this.starFullImageUrl = starFullImageUrl
    // this.starHalfImageUrl = starHalfImageUrl
    // this.starEmptyImageUrl = starEmptyImageUrl
  }
}