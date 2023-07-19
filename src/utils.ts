export function mountSearchSet<ItemType>(
  _items: ItemType[],
  _offset?: number,
  _total?: number
) {
  return {
    _timestamp: Date.now(),
    _total,
    _size: _items.length,
    _offset,
    _next: "string",
    _previous: "string",
    _items,
  };
}
