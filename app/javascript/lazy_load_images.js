const LazyLoadImages = (() => {
  const LAZY_LOAD_IMAGE_SELECTOR = '[data-lazy-image]'

  const options = {
    threshold: 0,
  }

  const loadImage = image => {
    image.src = image.dataset.lazyImage
  }

  const handleObserveImage = (entries, observer) => {
    entries.forEach(entry => {
      if (!entry.isIntersecting) { return; }

      const image = entry.target
      observer.unobserve(image)
      loadImage(image)
    })
  }

  const observe = observer => element => observer.observe(element)

  const start = ({ document } = window) => {
    const images = [
      ...document.querySelectorAll(LAZY_LOAD_IMAGE_SELECTOR)
    ]

    if (images.length == 0) { return; }

    const observer = new IntersectionObserver(handleObserveImage, options)
    const observeImage = observe(observer)

    images.forEach(observeImage)
  }

  return { start }
})()

export default LazyLoadImages
