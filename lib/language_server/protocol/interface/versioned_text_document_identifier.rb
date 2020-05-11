module LanguageServer
  module Protocol
    module Interface
      class VersionedTextDocumentIdentifier < TextDocumentIdentifier
        def initialize(uri:, version:)
          @attributes = {}

          @attributes[:uri] = uri
          @attributes[:version] = version

          @attributes.freeze
        end

        #
        # The version number of this document. If a versioned text document identifier
        # is sent from the server to the client and the file is not open in the editor
        # (the server has not received an open notification before) the server can send
        # `null` to indicate that the version is known and the content on disk is the
        # truth (as speced with document content ownership).
        #
        # The version number of a document will increase after each change, including
        # undo/redo. The number doesn't need to be consecutive.
        #
        # @return [number]
        def version
          attributes.fetch(:version)
        end

        attr_reader :attributes

        def to_hash
          attributes
        end

        def to_json(*args)
          to_hash.to_json(*args)
        end
      end
    end
  end
end
