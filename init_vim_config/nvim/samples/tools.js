import { isNil } from 'ramda'
import { isAfter } from 'date-fns'
import { throwError } from '~/error'

export const isExpired = date => isAfter(new Date(), new Date(date))

export const rejectNull = msg => x =>
  isNil(x) ? throwError('FORBIDDEN_NULL_VALUE', msg, x) : x

export const on = (errorName, fn) => error => {
  if (error.name === errorName) return fn(error)
  throw error
}

export const asList = xs => xs || []

export const isIn = (xs, key = 'id') => x => x && xs.includes(x[key])
