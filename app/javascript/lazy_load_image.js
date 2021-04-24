import buildIntersectionObserver, { actOnFirstIntersection } from 'helpers/build_intersection_observer.js'
import buildMutationObserver, { actOnMatchingMutation } from 'helpers/build_mutation_observer.js'

const LazyLoadImage = (() => {
  const LAZY_LOAD_IMAGE_SELECTOR = '[data-lazy-image]'

  const loadImage = image => {
    image.src = image.dataset.lazyImage
  }

  const start = ({ document } = window) => {
    const images = document.querySelectorAll(LAZY_LOAD_IMAGE_SELECTOR)
    const handleImageIntersect = actOnFirstIntersection(loadImage)
    const [_iObserver, intersectImage] = buildIntersectionObserver(handleImageIntersect)
    const setupLazyImage = actOnMatchingMutation(LAZY_LOAD_IMAGE_SELECTOR, intersectImage)
    const [_mObserver, setupImage] = buildMutationObserver(setupLazyImage)

    images.forEach(intersectImage)
    setupImage(document)
  }

  return { start }
})()

export default LazyLoadImage
