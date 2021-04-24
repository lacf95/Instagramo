const defaultOptions = {
  threshold: 0,
}

const buildIntersectionObserver = (callback, options = defaultOptions) => {
  const observer = new IntersectionObserver(callback, options)
  const observe = observer => element => observer.observe(element)

  return [observer, observe(observer)]
}

const actOnFirstIntersection = callback => async (entries, observer) => {
  await Promise.all(entries.map(async entry => {
    if (!entry.isIntersecting) { return; }

    const element = entry.target
    observer.unobserve(element)
    return callback(element)
  }))
}

export {
  buildIntersectionObserver as default,
  actOnFirstIntersection,
}
