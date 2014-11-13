# MsgpackResponder

MsgpackResponder provides MessagePack included ActionController::Parameters deserializer and add :mpac support to respond_with, respond_to

## Usage

```
respond_to do |format|
  format.mpac
end
```

When ActionController is given request params contain MessagePack,

```
def create
  puts params #=> params have already deserialized parameters
end
```
