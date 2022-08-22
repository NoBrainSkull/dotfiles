import type { Ref } from 'vue'
import { ref, computed, watch, isRef } from 'vue'
import type { MaybeRef } from '@vueuse/shared'
import { useDebounce } from '@vueuse/core'
import { useQuasar } from 'quasar'

export const unref = <T>(value: MaybeRef<T>): T => isRef(value) ? value.value : value
export const useIsBetween = (ref: Ref<number | null>, min: MaybeRef<number>, max: MaybeRef<number>, strict: MaybeRef<boolean> = false) => computed(() => {
  if (ref.value === null) return false
  return unref(strict)
    ? ref.value > unref(min) && ref.value < unref(max)
    : ref.value >= unref(min) && ref.value <= unref(max)
})

export const useTruncate = () => (text: string, length: number) =>
  text.length <= length ? text : `${text.substr(0, length)}\u2026`

export const useOdd = () => (nbr: number) => nbr % 2

export const centsToEuros = (v = 0): number => v / 100
export const eurosToCents = (v = 0): number => Math.round(v * 100)

export const useLocalFetcher = <T>(options: T) => {
  return {
    json: () => ({
      get: () => {
        const isFetching = ref(false)
        const isFinished = ref(true)
        const data = ref<T>()
        data.value = options
        return {
          isFetching,
          isFinished,
          data,
          execute: () => {
            isFetching.value = true
            return Promise.resolve(options).then((opts) => {
              isFinished.value = true
              isFetching.value = false
              data.value = opts
            })
          },
        }
      },
    }),
  }
}

const makeParam = (key: string, value: any) => {
  switch (true) {
    case Array.isArray(value):
      return value.map((v: string) => `${encodeURIComponent(key)}[]=${encodeURIComponent(v)}`).join('&')
    default:
      return `${encodeURIComponent(key)}=${encodeURIComponent(value)}`
  }
}
export const useQueryParams = (params: Record<string, any>) =>
  Object.keys(params)
    .filter(k => params[k] !== undefined)
    .map(k => makeParam(k, params[k]))
    .join('&')

export const useUrl = (route: string, params: Record<string, any>) => `${route}?${useQueryParams(params)}`

export const useComputedUrl = (route: string, params: MaybeRef<Record<string, any>>, delay = 500) => {
  const url = computed(() => useUrl(unref(route), unref(params)))
  return useDebounce(url, delay)
}

export function escape(str: string) {
  return str.replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
}

export const useIsPWAInstalled = () => {
  if (process.env.SERVER) return false

  const q = useQuasar()
  const UA = navigator.userAgent
  const IOS = q.platform.is.ios
  const standalone = window.matchMedia('(display-mode: standalone)').matches
  const INSTALLED = !!(standalone || (IOS && !UA.match(/Safari/)))

  return INSTALLED
}
