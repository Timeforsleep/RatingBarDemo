@Observed
export class RatedStarBean {
  starImageUrl: ResourceStr|string = ''
  starHeight: number = 50
  starWidth: number = 50

  constructor(starImageUrl: ResourceStr|string,
              starHeight: number,
              starWidth: number,
  ) {
    this.starImageUrl = starImageUrl
    this.starHeight = starHeight
    this.starWidth = starWidth
  }
}