# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


((window) ->

  # IE does not support progress

  # add new images

  # use ImagesLoaded

  # reset progress counter

  # reset container

  # -----  ----- //

  # return doc fragment with
  getItems = ->
    items = ""
    i = 0

    while i < 7
      items += getImageItem()
      i++
    items

  # return an <li> with a <img> in it
  getImageItem = ->
    item = "<li class=\"is-loading\">"
    item.className = "is-loading"
    size = Math.random() * 3 + 1
    width = Math.random() * 110 + 100
    width = Math.round(width * size)
    height = Math.round(140 * size)
    rando = Math.ceil(Math.random() * 1000)

    # 10% chance of broken image src
    # random parameter to prevent cached images

    # use lorempixel for great random images
    src = (if rando < 100 then "//foo/broken-" + rando + ".jpg" else "//lorempixel.com/" + width + "/" + height + "/" + "?" + rando)
    item += "<img src=\"" + src + "\" /></li>"
    item

  # -----  ----- //
  resetProgress = ->
    $status.css opacity: 1
    loadedImageCount = 0
    $progress.attr "max", imageCount  if supportsProgress
    return
  updateProgress = (value) ->
    if supportsProgress
      $progress.attr "value", value
    else

      # if you don't support progress elem
      $status.text value + " / " + imageCount
    return

  # triggered after each item is loaded
  onProgress = (imgLoad, image) ->

    # change class if the image is loaded or broken
    $item = $(image.img).parent()
    $item.removeClass "is-loading"
    $item.addClass "is-broken"  unless image.isLoaded

    # update progress element
    loadedImageCount++
    updateProgress loadedImageCount
    return

  # hide status when done
  onAlways = ->
    $status.css opacity: 0
    return
  "use strict"
  $progress = undefined
  $status = undefined
  supportsProgress = undefined
  loadedImageCount = undefined
  imageCount = undefined
  $ ->
    $demo = $("#demo")
    $container = $demo.find("#image-container")
    $status = $demo.find("#status")
    $progress = $demo.find("progress")
    supportsProgress = $progress[0] and $progress[0].toString().indexOf("Unknown") is -1
    $("#add").click ->
      items = getItems()
      console.log items
      $container.prepend $(items)
      $container.imagesLoaded().progress(onProgress).always onAlways
      imageCount = $container.find("img").length
      resetProgress()
      updateProgress 0
      return

    $("#reset").click ->
      $container.empty()
      return

    return

  return
) window

jQuery(document).ready ->
  $container = $("#masonry-container")
  $container.imagesLoaded ->
    $container.masonry
      itemSelector: ".box"
      gutterWidth: 20
      columnWidth: (containerWidth) ->
        containerWidth / 5
      isAnimated: true
      isFitWidth: true
      animationOptions:
        duration: 750
        easing: "linear"
        queue: false

    return

  return


  return
