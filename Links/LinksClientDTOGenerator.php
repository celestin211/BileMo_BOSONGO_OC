<?php

namespace App\Links;

class LinksClientDTOGenerator extends LinksGenerator
{
    protected function createLinks(object $object)
    {
        $object->set_links(['self' => $this->urlGenerator->generate('detailsClient', ['id' => $object->getId()], 0),
                            'delete' => $this->urlGenerator->generate('deleteClient', ['id' => $object->getId()], 0),
                            'list' => $this->urlGenerator->generate('ListOfClient', [], 0),
                            'add' => $this->urlGenerator->generate('addClient', [], 0),
        ]);
    }
}
