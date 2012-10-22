# Doit

An extremely simple CLI todo list

## Installation

    $ gem install doit

## Usage

Add tasks with `doit add`

    $ doit add take out trash
    Added: take out trash

    $ doit add laundry
    Added laundry

List tasks with no args `doit`

    $ doit
    0: take out trash
    1: laundry

Remove tasks by index `doit rm`

    $ doit rm 0
    Removed: take out trash

    $ doit
    0: laundry

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
