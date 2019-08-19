topo = {
  name: 'minimega-mergenet',
  nodes: [deb('a'), deb('b'), deb('c'), deb('d')],
  switches: [cumulus('sw')],
  links: [
    Link('a', 1, 'sw', 1),
    Link('b', 1, 'sw', 2),
    Link('c', 1, 'sw', 3),
    Link('d', 1, 'sw', 4),
  ]
}

function deb(name) {
  return {
    name: name,
    image: 'debian-buster',
    cpu: { cores: 8, passthru: true },
    memory: { capacity: GB(8) },
    mounts: [{ source: env.PWD+'/../../..', point: '/tmp/mm' }],
  }
}

function cumulus(name) {
  return {
    name: name,
    image: 'cumulusvx-3.7',
    cpu: { cores: 2 },
    memory: { capacity: GB(4) },
    mounts: [{ source: env.PWD+'/../../..', point: '/tmp/mm' }],
  }
}
