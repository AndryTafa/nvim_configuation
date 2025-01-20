local setup, faster = pcall(require, "faster")
if not setup then
  return
end

faster.setup()
