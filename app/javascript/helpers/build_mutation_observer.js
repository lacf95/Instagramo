const defaultOptions = {
  attributes: true,
  subtree: true,
  childList: true,
}

const buildMutationObserver = (callback, options = defaultOptions) => {
  const observer = new MutationObserver(callback)
  const observe = observer => element => observer.observe(element, options)

  return [observer, observe(observer)]
}

const actOnMatchingMutation = (selector, callback) => mutations => {
  mutations.forEach(mutation => {
    if (mutation.type != 'childList') { return; }

    mutation.addedNodes.forEach(node => {
      if (!node.matches) { return; }

      if (node.matches(selector)) {
        callback(node)
      }

      node.querySelectorAll(selector).forEach(callback)
    })
  })
}

export {
  buildMutationObserver as default,
  actOnMatchingMutation,
}
