<?php

namespace App\DTO;

use App\Entity\Client;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="App\Repository\ClientRepository")
 */
class ClientDTO
{
    private $id;
    private $email;
    private $firstname;
    private $lastname;
    private $_links;

    public function __construct(
        Client $client
    ) {
        $this->id = $client->getId();
        $this->email = $client->getEmail();
        $this->firstname = $client->getFirstname();
        $this->lastname = $person->getLastname();
        $this->_links = $client->get_links();
    }

    public function getPeopleDTO(array $people)
    {
        foreach ($people as $client) {
            $clientDTO = new self($client);
            $peopleDTO[] = $clientDTO;
        }

        return $peopleDTO;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function getFirstname(): ?string
    {
        return $this->firstname;
    }

    public function getLastname(): ?string
    {
        return $this->lastname;
    }

    public function get_Links(): ?array
    {
        return $this->_links;
    }

    public function set_Links(array $links): self
    {
        $this->_links = $links;

        return $this;
    }
}
