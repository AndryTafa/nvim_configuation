local setup, better_ts_errors = pcall(require, "better-ts-errors")
if not setup then
  return
end

better_ts_errors.setup()
