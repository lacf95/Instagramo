import buildIntersectionObserver, { actOnFirstIntersection } from 'helpers/build_intersection_observer.js'
import buildMutationObserver, { actOnMatchingMutation } from 'helpers/build_mutation_observer.js'
import Rails from "@rails/ujs"

const LazyRequest = (() => {
  const LAZY_REQUEST_SELECTOR = '[data-lazy-request]'

  const request = async requestElement => {
    const url = requestElement.dataset.lazyRequest
    return Rails.ajax({ url, type: 'get' })
  }

  const start = ({ document } = window) => {
    const requestElements = document.querySelectorAll(LAZY_REQUEST_SELECTOR)
    const handleRequestElementIntersect = actOnFirstIntersection(request)
    const [_iObserver, intersectRequestElement] = buildIntersectionObserver(handleRequestElementIntersect)
    const setupLazyRequestElement = actOnMatchingMutation(LAZY_REQUEST_SELECTOR, intersectRequestElement)
    const [_mObserver, setupRequestElement] = buildMutationObserver(setupLazyRequestElement)

    requestElements.forEach(intersectRequestElement)
    setupRequestElement(document)
  }

  return { start }
})()

export default LazyRequest
