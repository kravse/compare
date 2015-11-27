Main = (()->
  imgLoaded = 0
  locations = []
  
  init = () =>
    $.each siteData, (key) ->
      locations.push(key)

    $(window).on 'hashchange', =>
      checkHash(location.hash.substring(1))
    
    checkHash(location.hash.substring(1))
    
  checkHash = (hash) ->
    if locations.indexOf(hash) > -1
      renderPage(hash)
    else
       window.location.hash = locations[0]

  renderPage = (page) =>

    currentIndex = locations.indexOf(page)
    
    nextIndex = currentIndex + 1
    previousIndex = currentIndex - 1
    
    if previousIndex < 0
      previousIndex = locations.length-1
    if nextIndex > locations.length-1
      nextIndex = 0

    data = siteData[page]

    source = $('#entry-template').html()
    template = Handlebars.compile(source)
    context = 
      location: data.location
      locationID: data.id
      description: data.description
      renderSrc: data.renderSrc
      realitySrc: data.realitySrc
      previousLocationID: '#'+locations[previousIndex]
      nextLocationID: '#'+locations[nextIndex]

    html = template(context)
    $('.content').html(html)
    
    $(".tt-img").load(->
      startTwentyTwenty()
    )

  startTwentyTwenty = () ->
    if(imgLoaded == 0)
      imgLoaded = 1
    else if (imgLoaded == 1)
      $('.tt-box').twentytwenty()

  return {
    init: init
  }

)()