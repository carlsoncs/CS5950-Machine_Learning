require "rinruby"

class DataWrangler

  R.eval('data(iris)')
  iris=R.pull('iris')

  puts iris




end